import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
import 'package:navika/state/verbs/verb-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/present-tense/present-tense-question-content.dart';
import 'package:navika/widgets/exercises/verbs/past-tense/past-tense-question-content.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/exercise-header.dart';
import 'package:navika/widgets/shared/info-banner.dart';
import 'package:provider/provider.dart';

class VerbExercise extends StatelessWidget {
  final String title;
  final VerbTenses tense;
  final String description;
  final String imagePath;
  final String? youtubeLink;

  const VerbExercise({
    Key? key,
    required this.tense,
    required this.title,
    required this.description,
    required this.imagePath,
    this.youtubeLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text(SbcLabels.verbs, style: HEADER_TEXT_STYLE),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ChangeNotifierProvider<ExerciseNavNotifier>(
          create: (context) => ExerciseNavNotifier(isVerb: true),
          child: Consumer<ExerciseNavNotifier>(
            builder: (context, navNotifier, child) => Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InfoBanner(
                      imagePath: imagePath,
                      label: title,
                      description: description,
                      youtubeLink: youtubeLink,
                    ),
                    AdCard(),
                    ExerciseHeader(
                      setPrevious: navNotifier.setPrevious,
                      setNext: navNotifier.setNext,
                      clear: navNotifier.clearInput,
                    ),
                    ChangeNotifierProvider<VerbNotifier>(
                      create: (context) => VerbNotifier(navNotifier.getActive),
                      child: Consumer<VerbNotifier>(
                        builder: (context, verbNotifier, child) => Container(
                          child: this.tense == VerbTenses.PastPerfect
                              ? PastTenseQuestionContent(
                                  verb: navNotifier.getActive().verb,
                                  state: navNotifier.getActive().userEntryState,
                                  isAllCorrect:
                                      navNotifier.getActive().isAllCorrect,
                                  onChanged:
                                      (String pronoun, String newValue) =>
                                          verbNotifier.updateState(
                                              pronoun.toString(),
                                              newValue,
                                              this.tense),
                                )
                              : PresentTenseQuestionContent(
                                  verb: navNotifier.getActive().verb,
                                  isAllCorrect:
                                      navNotifier.getActive().isAllCorrect,
                                  state: navNotifier.getActive().userEntryState,
                                  onChanged:
                                      (String pronoun, String newValue) =>
                                          verbNotifier.updateState(
                                              pronoun, newValue, this.tense),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
