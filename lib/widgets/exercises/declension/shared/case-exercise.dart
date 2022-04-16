import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-question-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension-guide.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/home-button-wrapper.dart';
import 'package:navika/widgets/shared/info-banner.dart';
import 'package:navika/widgets/shared/navigation-header-wrapper.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:provider/provider.dart';

class CaseExercise extends StatelessWidget {
  final String title;
  final Cases caseType;
  final ExerciseTypes exerciseType;
  final String description;
  final String imagePath;
  final String? youtubeLink;

  CaseExercise({
    Key? key,
    required this.title,
    required this.caseType,
    required this.description,
    required this.imagePath,
    this.exerciseType = ExerciseTypes.unspecified,
    this.youtubeLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

    return SettingsConsumerWrapper(
      getChildWidget: (settings) => ChangeNotifierProvider<ExerciseNavNotifier>(
        create: (context) => ExerciseNavNotifier(
            caseType: caseType,
            exerciseType: exerciseType,
            dialect: settings.dialectType),
        child: Consumer<ExerciseNavNotifier>(
          builder: (context, navNotifier, child) {
            return Scaffold(
              appBar: N.navAppBar(title: SbcLabels.cases, context: context),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InfoBanner(
                        label: title,
                        description: description,
                        youtubeLink: youtubeLink,
                      ),
                      const AdCard(),
                      NavigationHeaderWrapper(navNotifier: navNotifier),
                      GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          if (_debounce.isActive) {
                            _debounce.cancel();
                          }

                          _debounce = Timer(
                              const Duration(milliseconds: DEBOUNCE_TIME), () {
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              persistentFooterButtons: [
                NFooterMenu(buttons: [
                  NFooterButton(
                    onPressed: () {
                      navNotifier.shuffleAndClear();
                    },
                    icon: Icons.refresh_outlined,
                    text: N.t(context).refresh,
                  ),
                  HomeButtonWrapper(),
                  NFooterButton(
                    active: true,
                    onPressed: () {
                      final dest = DeclensionGuide(
                        startingCase: caseType,
                        dialect: settings.dialectType,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => dest),
                      );
                    },
                    icon: Icons.help_center_outlined,
                    text: N.t(context).grammar,
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
