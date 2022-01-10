import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-free-form.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-header.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/shared/shadow-box.dart';

class PresentTenseQuestionContent extends StatelessWidget {
  final Verb verb;
  final bool isAllCorrect;
  final Function(String, String) onChanged;
  final HashMap<String, String> state;

  const PresentTenseQuestionContent({
    Key? key,
    required this.verb,
    required this.isAllCorrect,
    required this.onChanged,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      isCorrect: this.isAllCorrect,
      child: Column(
        children: [
          VerbHeader(verb: this.verb, isAllCorrect: this.isAllCorrect),
          getBody(context),
        ],
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            VerbFreeForm(
              startText: 'Ja',
              activeValue: this.state[ConjPronounTypes.jaMasc.toString()] ?? '',
              correctValues: [this.verb.present.ja],
              gender: Genders.Unspecific,
              verb: verb,
              onChanged: onChanged,
              stateKey: ConjPronounTypes.jaMasc.toString(),
            ),
            VerbFreeForm(
              startText: 'Ti',
              activeValue: this.state[ConjPronounTypes.tiMasc.toString()] ?? '',
              correctValues: [this.verb.present.ti],
              gender: Genders.Unspecific,
              verb: verb,
              onChanged: onChanged,
              stateKey: ConjPronounTypes.tiMasc.toString(),
            ),
            VerbFreeForm(
              startText: 'On/Ona/Oni',
              activeValue: this.state[ConjPronounTypes.on.toString()] ?? '',
              correctValues: [this.verb.present.on],
              gender: Genders.Unspecific,
              verb: verb,
              onChanged: onChanged,
              stateKey: ConjPronounTypes.on.toString(),
            ),
          ],
        ),
        Column(
          children: [
            VerbFreeForm(
              startText: 'Mi',
              activeValue: this.state[ConjPronounTypes.miMasc.toString()] ?? '',
              correctValues: [this.verb.present.mi],
              gender: Genders.Unspecific,
              verb: verb,
              onChanged: onChanged,
              stateKey: ConjPronounTypes.miMasc.toString(),
            ),
            VerbFreeForm(
              startText: 'Vi',
              activeValue: this.state[ConjPronounTypes.viMasc.toString()] ?? '',
              correctValues: [this.verb.present.vi],
              gender: Genders.Unspecific,
              verb: verb,
              onChanged: onChanged,
              stateKey: ConjPronounTypes.viMasc.toString(),
            ),
            VerbFreeForm(
              startText: 'Oni/One/Ona (pl)',
              activeValue: this.state[ConjPronounTypes.oni.toString()] ?? '',
              correctValues: [this.verb.present.oni],
              gender: Genders.Unspecific,
              verb: verb,
              onChanged: onChanged,
              stateKey: ConjPronounTypes.oni.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
