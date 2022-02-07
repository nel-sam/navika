import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
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
            builder: (context, navNotifier, child) {
              final stateITem = navNotifier.getActive();

              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InfoBanner(
                        imagePath: imagePath,
                        label: title,
                        description: description,
                        youtubeLink: youtubeLink,
                      ),
                      const AdCard(),
                      ExerciseHeader(
                        setPrevious: navNotifier.setPrevious,
                        setNext: navNotifier.setNext,
                        clear: navNotifier.clearInput,
                        getCounter: navNotifier.getCounter,
                      ),
                      Container(
                        child: this.tense == VerbTenses.PastPerfect
                            ? PastTenseQuestionContent(
                                verb: stateITem.verb,
                                state: stateITem.userEntryState,
                                isAllCorrect: stateITem.isCorrect,
                                onChanged: (String pronoun, String newValue) =>
                                    stateITem.updateState(pronoun.toString(),
                                        newValue, this.tense),
                              )
                            : PresentTenseQuestionContent(
                                verb: stateITem.verb,
                                isAllCorrect: stateITem.isCorrect,
                                state: stateITem.userEntryState,
                                onChanged: (String pronoun, String newValue) =>
                                    stateITem.updateState(
                                        pronoun, newValue, this.tense),
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
