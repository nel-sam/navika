import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/verbs/verb-exercises.dart';
import 'package:navika/state/verbs/verb-question-state-item.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-question-content.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:provider/provider.dart';

class VerbExercise extends StatelessWidget {
  final String title;
  final NavikaBanner banner;

  const VerbExercise({
    Key? key,
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
                  ...model.exerciseItems.map((e) => VerbQuestionContent(
                        verb: e.verb,
                        gender: e.gender,
                        isPlural: e.isPlural,
                        isAllCorrect: e.isCorrect,
                        onChanged: (String newValue) {
                          String correctVal = e.verb
                              .getConjugation(e.tense, e.conjPronounTypes);

                          final newState = VerbQuestionStateItem(
                            tense: e.tense,
                            verb: e.verb,
                            gender: e.gender,
                            isPlural: e.isPlural,
                            conjPronounTypes: e.conjPronounTypes,
                            isCorrect: newValue == correctVal,
                          );
                          model.modifyStateItem(e, newState);
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
