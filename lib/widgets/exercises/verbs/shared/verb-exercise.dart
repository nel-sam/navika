import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/state/verbs/verb-exercises.dart';
import 'package:navika/state/verbs/verb-question-state-item.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/past-tense-question-content.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:provider/provider.dart';

class VerbExercise extends StatelessWidget {
  final String title;
  final NavikaBanner banner;
  final VerbTenses tense;

  const VerbExercise({
    Key? key,
    required this.tense,
    required this.title,
    required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text(title, style: HEADER_TEXT_STYLE),
      ),
      body: ChangeNotifierProvider<VerbExercises>(
        create: (context) => VerbExercises(),
        child: Consumer<VerbExercises>(
          builder: (context, model, child) => Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  banner,
                  if (this.tense == VerbTenses.PastPerfect)
                    ...model.exerciseItems.map(
                      (e) => PastTenseQuestionContent(
                        verb: e.verb,
                        state: e.userEntryState,
                        isAllCorrect: e.isAllCorrect,
                        onChanged: (ConjPronounTypes pronoun, String newValue) {
                          e.userEntryState = e.userEntryState;
                          e.userEntryState[pronoun.toString()] = newValue;
                          e.updateIsAllCorrect();
                        },
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
