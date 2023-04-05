import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/state/exercise_nav_notifier.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/verbs/past_tense/past_tense_question_content.dart';
import 'package:navika/widgets/exercises/verbs/present_tense/present_tense_question_content.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad_card.dart';
import 'package:navika/widgets/shared/exercise_navigation_wrapper.dart';
import 'package:navika/widgets/shared/info_banner.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:provider/provider.dart';

class VerbExercise extends StatelessWidget {
  final String title;
  final VerbTenses tense;
  final String description;
  final String imagePath;
  final String? youtubeLink;
  final DialectType dialect;
  final ExerciseTypes exerciseType;
  final bool isPremium;

  const VerbExercise({
    Key? key,
    required this.isPremium,
    required this.tense,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.dialect,
    required this.exerciseType,
    this.youtubeLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

    return Scaffold(
      appBar: N.navAppBar(title: SbcLabels.verbs, context: context),
      body: ChangeNotifierProvider<ExerciseNavNotifier>(
        create: (context) => ExerciseNavNotifier(
          isPremium: this.isPremium,
          dialect: dialect,
          exerciseType: exerciseType,
        ),
        child: Consumer<ExerciseNavNotifier>(
          builder: (context, navNotifier, child) {
            final stateITem = navNotifier.getActive();

            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              onHorizontalDragUpdate: (details) {
                if (_debounce.isActive) {
                  _debounce.cancel();
                }

                _debounce =
                    Timer(const Duration(milliseconds: DEBOUNCE_TIME), () {
                  if (details.delta.dx > 0) {
                    navNotifier.setPrevious();
                  }

                  if (details.delta.dx < 0) {
                    navNotifier.setNext();
                  }
                });
              },
              child: SafeArea(
                child: Center(
                  child: SizedBox(
                    width: N.getMaxScreenWidth(),
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            children: [
                              InfoBanner(
                                label: title,
                                description: description,
                                youtubeLink: youtubeLink,
                              ),
                              const AdCard(),
                              Container(
                                child: this.tense == VerbTenses.PastPerfect
                                    ? PastTenseQuestionContent(
                                        verb: stateITem.verb,
                                        state: stateITem.userEntryState,
                                        isAllCorrect: stateITem.isCorrect,
                                        onChanged:
                                            (String pronoun, String newValue) =>
                                                stateITem._updateState(
                                                    pronoun.toString(),
                                                    newValue,
                                                    this.tense),
                                      )
                                    : PresentTenseQuestionContent(
                                        verb: stateITem.verb,
                                        isAllCorrect: stateITem.isCorrect,
                                        state: stateITem.userEntryState,
                                        onChanged: (String pronoun,
                                                String newValue) =>
                                            stateITem._updateState(
                                                pronoun, newValue, this.tense),
                                      ),
                              ),
                              Expanded(child: Container()),
                              ExerciseNavigationWrapper(
                                  navNotifier: navNotifier),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
