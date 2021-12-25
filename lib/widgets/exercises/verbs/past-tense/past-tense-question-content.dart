import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-free-form.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-header.dart';
import 'package:navika/widgets/shared/shadow-box.dart';

class PastTenseQuestionContent extends StatelessWidget {
  final Verb verb;
  final bool isAllCorrect;
  final Function(String, String) onChanged;
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
          VerbHeader(verb: verb, isAllCorrect: this.isAllCorrect),
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
                  stateKey: ConjPronounTypes.JaMasc.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.JaMasc.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.jaMasc],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ja sam',
                  gender: Genders.Feminine,
                  stateKey: ConjPronounTypes.JaFem.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.JaFem.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.jaFem],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ti si',
                  gender: Genders.Masculine,
                  stateKey: ConjPronounTypes.tiMasc.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.tiMasc.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.tiMasc],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ti si',
                  gender: Genders.Feminine,
                  stateKey: ConjPronounTypes.tiFem.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.tiFem.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.tiFem],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'On je',
                  gender: Genders.Masculine,
                  stateKey: ConjPronounTypes.on.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.on.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.on],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ona je',
                  gender: Genders.Feminine,
                  stateKey: ConjPronounTypes.ona.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.ona.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.ona],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ono je',
                  gender: Genders.Neuter,
                  stateKey: ConjPronounTypes.ono.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.ono.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.ono],
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
                  stateKey: ConjPronounTypes.miMasc.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.miMasc.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.miMasc],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Mi smo',
                  gender: Genders.Feminine,
                  stateKey: ConjPronounTypes.miFem.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.miFem.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.miFem],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Vi ste',
                  gender: Genders.Masculine,
                  stateKey: ConjPronounTypes.viMasc.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.viMasc.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.viMasc],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Vi ste',
                  gender: Genders.Feminine,
                  stateKey: ConjPronounTypes.viFem.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.viFem.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.viFem],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Oni su',
                  gender: Genders.Masculine,
                  stateKey: ConjPronounTypes.oni.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.oni.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.oni],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'One su',
                  gender: Genders.Feminine,
                  stateKey: ConjPronounTypes.one.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.one.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.one],
                  verb: verb,
                  onChanged: onChanged,
                ),
                VerbFreeForm(
                  startText: 'Ona su',
                  gender: Genders.Neuter,
                  stateKey: ConjPronounTypes.onaPl.toString(),
                  activeValue:
                      this.state[ConjPronounTypes.onaPl.toString()] ?? '.',
                  correctValues: [this.verb.pastPerfect.onaPl],
                  verb: verb,
                  onChanged: onChanged,
                ),
              ],
            ),
          ],
        ));
  }
}
