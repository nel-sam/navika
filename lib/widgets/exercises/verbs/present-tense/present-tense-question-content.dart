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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            children: [
              VerbFreeForm(
                startText: 'Ja',
                activeValue:
                    this.state[ConjPronounTypes.JaMasc.toString()] ?? '.',
                correctValues: [this.verb.present.ja],
                gender: Genders.Unspecific,
                verb: verb,
                onChanged: onChanged,
                stateKey: ConjPronounTypes.JaMasc.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
