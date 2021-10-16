import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/question-free-form.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/shared/shadow-box.dart';

class VerbQuestionContent extends StatelessWidget {
  final Verb verb;
  // final Genders gender;
  // final bool isPlural;
  final bool isAllCorrect;
  final Function(ConjPronounTypes, String) onChanged;
  final HashMap<ConjPronounTypes, String> state;

  const VerbQuestionContent({
    Key? key,
    required this.verb,
    // required this.gender,
    // required this.isPlural,
    required this.isAllCorrect,
    required this.onChanged,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      isCorrect: isAllCorrect,
      child: Column(
        children: [
          getHeader(context, verb),
          getBody(),
        ],
      ),
    );
  }

  Widget getBody() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Ja masc
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ja sam (masc)',
                  style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
                ),
                QuestionFreeForm(
                    hintValue: this.verb.infinitive,
                    onChanged: (String newValue) =>
                        this.onChanged(ConjPronounTypes.JaMasc, newValue),
                    activeValue: this.state[ConjPronounTypes.JaMasc] ?? '.',
                    correctValues: [this.verb.pastPerfect!.jaMasc]),
              ],
            )
          ],
        ));
  }

  Widget getHeader(BuildContext context, Verb verb) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: this.isAllCorrect
                ? Icon(Icons.check_circle_outline, color: CORRECT_COLOR)
                : Icon(Icons.close_outlined, color: WRONG_COLOR),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: NText([N.NTextSpan(this.verb.infinitive, isBold: true)]),
          ),
          // ElevatedButton(
          //     onPressed: () => {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => CaseExerciseHelp(combos: combos),
          //             ),
          //           ),
          //         },
          //     child: Icon(Icons.help)),
        ],
      ),
    );
  }
}
