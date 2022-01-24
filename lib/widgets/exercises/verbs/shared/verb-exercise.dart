import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
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
        title: Text(APP_NAME, style: HEADER_TEXT_STYLE),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ChangeNotifierProvider<VerbNotifier>(
          create: (context) => VerbNotifier(),
          child: Consumer<VerbNotifier>(
            builder: (context, model, child) => Center(
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
                      setPrevious: model.setPrevious,
                      setNext: model.setNext,
                      clear: model.clearInput,
                    ),
                    if (this.tense == VerbTenses.PastPerfect)
                      PastTenseQuestionContent(
                        verb: model.getActive().verb,
                        state: model.getActive().userEntryState,
                        isAllCorrect: model.getActive().isAllCorrect,
                        onChanged: (String pronoun, String newValue) =>
                            model.updateState(
                                pronoun.toString(), newValue, this.tense),
                      ),
                    if (this.tense == VerbTenses.Present)
                      PresentTenseQuestionContent(
                        verb: model.getActive().verb,
                        isAllCorrect: model.getActive().isAllCorrect,
                        state: model.getActive().userEntryState,
                        onChanged: (String pronoun, String newValue) =>
                            model.updateState(pronoun, newValue, this.tense),
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
