import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/exercise_nav_notifier.dart';
import 'package:navika/state/settings/settings_consumer_wrapper.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case_question_content.dart';
import 'package:navika/widgets/grammar-guides/number_guide/number_guide.dart';
import 'package:navika/widgets/shared/ad_card.dart';
import 'package:navika/widgets/shared/exercise_navigation_wrapper.dart';
import 'package:navika/widgets/shared/home_button_wrapper.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:provider/provider.dart';

class CountingExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

    return SettingsConsumerWrapper(
      getChildWidget: (settings) => ChangeNotifierProvider<ExerciseNavNotifier>(
        create: (context) => ExerciseNavNotifier(
            isPremium: settings.isPremium,
            exerciseType: ExerciseTypes.numbers_counting,
            dialect: settings.dialectType),
        child: Consumer<ExerciseNavNotifier>(
          builder: (context, navNotifier, child) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: Nrs.NrsAppBar(title: N.t('numbers'), context: context),
              body: Center(
                child: SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            ExerciseNavigationWrapper(
                                navNotifier: navNotifier),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              persistentFooterButtons: [
                NFooterMenu(buttons: [
                  HomeButtonWrapper(),
                  NFooterButton(
                    text: N.t('numberGuide'),
                    icon: Icons.list,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NumberGuide(dialect: settings.dialectType)),
                      );
                    },
                  ),
                ])
              ],
            );
          },
        ),
      ),
    );
  }
}
