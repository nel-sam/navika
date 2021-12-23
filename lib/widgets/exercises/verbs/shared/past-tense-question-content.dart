import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:navika/widgets/shared/question-free-form.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/shared/shadow-box.dart';

class PastTenseQuestionContent extends StatelessWidget {
  final Verb verb;
  final bool isAllCorrect;
  final Function(ConjPronounTypes, String) onChanged;
  final HashMap<String, String> state;

  const PastTenseQuestionContent({
    Key? key,
    required this.verb,
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
          getBody(context),
        ],
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              children: [
                VerbFreeForm(
                  startText: 'Ja sam',
                  gender: Genders.Masculine,
                  conjPronounType: ConjPronounTypes.JaMasc,
                  activeValue: this.state[ConjPronounTypes.JaMasc] ?? '.',
                  correctValues: [this.verb.pastPerfect!.jaMasc],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ja sam',
                  gender: Genders.Feminine,
                  conjPronounType: ConjPronounTypes.JaFem,
                  activeValue: this.state[ConjPronounTypes.JaFem] ?? '.',
                  correctValues: [this.verb.pastPerfect!.jaFem],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ti si',
                  gender: Genders.Masculine,
                  conjPronounType: ConjPronounTypes.tiMasc,
                  activeValue: this.state[ConjPronounTypes.tiMasc] ?? '.',
                  correctValues: [this.verb.pastPerfect!.tiMasc],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ti si',
                  gender: Genders.Feminine,
                  conjPronounType: ConjPronounTypes.tiFem,
                  activeValue: this.state[ConjPronounTypes.tiFem] ?? '.',
                  correctValues: [this.verb.pastPerfect!.tiFem],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'On je',
                  gender: Genders.Masculine,
                  conjPronounType: ConjPronounTypes.on,
                  activeValue: this.state[ConjPronounTypes.on] ?? '.',
                  correctValues: [this.verb.pastPerfect!.on],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ona je',
                  gender: Genders.Feminine,
                  conjPronounType: ConjPronounTypes.ona,
                  activeValue: this.state[ConjPronounTypes.ona] ?? '.',
                  correctValues: [this.verb.pastPerfect!.ona],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ono je',
                  gender: Genders.Neuter,
                  conjPronounType: ConjPronounTypes.ono,
                  activeValue: this.state[ConjPronounTypes.ono] ?? '.',
                  correctValues: [this.verb.pastPerfect!.ono],
                  verb: verb,
                  onChanged: onChanged,
                ),
              ],
            ),
            Column(
              children: [
                VerbFreeForm(
                  startText: 'Mi smo',
                  gender: Genders.Masculine,
                  conjPronounType: ConjPronounTypes.miMasc,
                  activeValue: this.state[ConjPronounTypes.miMasc] ?? '.',
                  correctValues: [this.verb.pastPerfect!.miMasc],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Mi smo',
                  gender: Genders.Feminine,
                  conjPronounType: ConjPronounTypes.miFem,
                  activeValue: this.state[ConjPronounTypes.miFem] ?? '.',
                  correctValues: [this.verb.pastPerfect!.miFem],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Vi ste',
                  gender: Genders.Masculine,
                  conjPronounType: ConjPronounTypes.viMasc,
                  activeValue: this.state[ConjPronounTypes.viMasc] ?? '.',
                  correctValues: [this.verb.pastPerfect!.viMasc],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Vi ste',
                  gender: Genders.Feminine,
                  conjPronounType: ConjPronounTypes.viFem,
                  activeValue: this.state[ConjPronounTypes.viFem] ?? '.',
                  correctValues: [this.verb.pastPerfect!.viFem],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Oni su',
                  gender: Genders.Masculine,
                  conjPronounType: ConjPronounTypes.oni,
                  activeValue: this.state[ConjPronounTypes.oni] ?? '.',
                  correctValues: [this.verb.pastPerfect!.oni],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'One su',
                  gender: Genders.Feminine,
                  conjPronounType: ConjPronounTypes.one,
                  activeValue: this.state[ConjPronounTypes.one] ?? '.',
                  correctValues: [this.verb.pastPerfect!.one],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ona su',
                  gender: Genders.Neuter,
                  conjPronounType: ConjPronounTypes.onaPl,
                  activeValue: this.state[ConjPronounTypes.onaPl] ?? '.',
                  correctValues: [this.verb.pastPerfect!.onaPl],
                  verb: verb,
                  onChanged: onChanged,
                ),
              ],
            ),
          ],
        ));
  }

  Widget getHeader(BuildContext context, Verb verb) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: this.isAllCorrect
                ? Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
                : Icon(WRONG_ANSWER_ICON, color: WRONG_COLOR),
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

class VerbFreeForm extends StatelessWidget {
  final String startText;
  final String activeValue;
  final List<String> correctValues;
  final ConjPronounTypes conjPronounType;
  final Genders gender;
  final Verb verb;
  final Function(ConjPronounTypes p1, String p2) onChanged;

  const VerbFreeForm({
    Key? key,
    required this.startText,
    required this.activeValue,
    required this.correctValues,
    required this.gender,
    required this.verb,
    required this.onChanged,
    required this.conjPronounType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  this.startText,
                  style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
                ),
                IconTextPair(
                  icon: N.getGenderIcon(gender),
                  text: N.getGenderString(context, gender),
                ),
              ],
            ),
            QuestionFreeForm(
              hintValue: this.verb.infinitive,
              onChanged: (String newValue) =>
                  this.onChanged(conjPronounType, newValue),
              activeValue: this.activeValue,
              correctValues: this.correctValues,
            ),
          ],
        ),
      ),
    );
  }
}
