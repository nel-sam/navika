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
          getBody(context),
        ],
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Ja masc
            Blah(
              startText: 'Ja sam',
              gender: Genders.Masculine,
              activeValue: this.state[ConjPronounTypes.JaMasc] ?? '.',
              correctValues: [this.verb.pastPerfect!.jaMasc],
              verb: verb,
              onChanged: onChanged,
            ),
            // Ja fem
            Blah(
              startText: 'Ja sam',
              gender: Genders.Feminine,
              activeValue: this.state[ConjPronounTypes.JaFem] ?? '.',
              correctValues: [this.verb.pastPerfect!.jaFem],
              verb: verb,
              onChanged: onChanged,
            ),
            // Ti masc
            Blah(
              startText: 'Ti si',
              gender: Genders.Masculine,
              activeValue: this.state[ConjPronounTypes.tiMasc] ?? '.',
              correctValues: [this.verb.pastPerfect!.tiMasc],
              verb: verb,
              onChanged: onChanged,
            ),
            // Ti fem
            Blah(
              startText: 'Ti si',
              gender: Genders.Feminine,
              activeValue: this.state[ConjPronounTypes.tiFem] ?? '.',
              correctValues: [this.verb.pastPerfect!.tiFem],
              verb: verb,
              onChanged: onChanged,
            ),
            // On
            Blah(
              startText: 'On je',
              gender: Genders.Masculine,
              activeValue: this.state[ConjPronounTypes.on] ?? '.',
              correctValues: [this.verb.pastPerfect!.on],
              verb: verb,
              onChanged: onChanged,
            ),
            // Ona
            Blah(
              startText: 'Ona je',
              gender: Genders.Feminine,
              activeValue: this.state[ConjPronounTypes.ona] ?? '.',
              correctValues: [this.verb.pastPerfect!.ona],
              verb: verb,
              onChanged: onChanged,
            ),
            // Ona
            Blah(
              startText: 'Ono je',
              gender: Genders.Neuter,
              activeValue: this.state[ConjPronounTypes.ono] ?? '.',
              correctValues: [this.verb.pastPerfect!.ono],
              verb: verb,
              onChanged: onChanged,
            ),
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

class Blah extends StatelessWidget {
  const Blah({
    Key? key,
    required this.startText,
    required this.activeValue,
    required this.correctValues,
    required this.gender,
    required this.verb,
    required this.onChanged,
  }) : super(key: key);

  final String startText;
  final String activeValue;
  final List<String> correctValues;
  final Genders gender;
  final Verb verb;
  final Function(ConjPronounTypes p1, String p2) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
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
                this.onChanged(ConjPronounTypes.JaMasc, newValue),
            activeValue: this.activeValue,
            correctValues: this.correctValues,
          ),
        ],
      ),
    );
  }
}
