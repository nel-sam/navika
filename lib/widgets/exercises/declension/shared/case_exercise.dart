import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/exercise_nav_notifier.dart';
import 'package:navika/state/settings/settings_consumer_wrapper.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case_question_content.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/declension_guide.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad_card.dart';
import 'package:navika/widgets/shared/exercise_navigation_wrapper.dart';
import 'package:navika/widgets/shared/home_button_wrapper.dart';
import 'package:navika/widgets/shared/info_banner.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:provider/provider.dart';

class CaseExercise extends StatelessWidget {
  final String title;
  final Cases caseType;
  final ExerciseTypes exerciseType;
  final String description;
  final String? youtubeLink;

  CaseExercise({
    Key? key,
    required this.title,
    required this.caseType,
    required this.description,
    this.exerciseType = ExerciseTypes.unspecified,
    this.youtubeLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

    return SettingsConsumerWrapper(
      getChildWidget: (settings) => ChangeNotifierProvider<ExerciseNavNotifier>(
        create: (context) => ExerciseNavNotifier(
            isPremium: settings.isPremium,
            caseType: caseType,
            exerciseType: exerciseType,
            dialect: settings.dialectType),
        child: Consumer<ExerciseNavNotifier>(
          builder: (context, navNotifier, child) {
            return Scaffold(
              appBar: N.navAppBar(title: SbcLabels.cases, context: context),
              body: Center(
                child: SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InfoBanner(
                              label: title,
                              description: description,
                              youtubeLink: youtubeLink,
                            ),
                            const AdCard(),
                            Divider(),
                            Expanded(
                              child: GestureDetector(
                                onHorizontalDragUpdate: (details) {
                                  if (_debounce.isActive) {
                                    _debounce.cancel();
                                  }

                                  _debounce = Timer(
                                      const Duration(
                                          milliseconds: DEBOUNCE_TIME), () {
                                    if (details.delta.dx > 0) {
                                      navNotifier.setPrevious();
                                    }

                                    if (details.delta.dx < 0) {
                                      navNotifier.setNext();
                                    }
                                  });
                                },
                                child: CaseQuestionContent(
                                  stateItem: navNotifier.getActive(),
                                  dialect: settings.dialectType,
                                ),
                              ),
                            ),
                            ExerciseNavigationWrapper(navNotifier: navNotifier),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              persistentFooterButtons: [
                // TODO: Small screens don't show this well. Test on small screens
                NFooterMenu(buttons: [
                  HomeButtonWrapper(),
                  NFooterButton(
                    active: true,
                    onPressed: () {
                      final dest = DeclensionGuide(
                          startingCase: caseType,
                          dialect: settings.dialectType);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => dest),
                      );
                    },
                    icon: Icons.help_center_outlined,
                    text: N.t('grammar'),
                  ),
                ]),
              ],
            );
          },
        ),
      ),
    );
  }
}
