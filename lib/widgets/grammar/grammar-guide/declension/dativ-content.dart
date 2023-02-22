import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/example-sentences.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/possessive-pronoun-section.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/dativ-lokativ-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class DativGrammarGuideContent extends StatelessWidget {
  final DialectType dialect;

  const DativGrammarGuideContent({
    Key? key,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NTextSpan(N.t('dativDescription')),
        ExampleSentences(
          sentences: [
            NTextMulti([
              TextSpan(text: 'On je kupio igračku '),
              TextSpan(
                  text: 'sinu',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Usprkos '),
              TextSpan(
                  text: 'bolesti',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: ', došao je na posao'),
            ]),
            NTextMulti([
              TextSpan(text: 'Dao sam '),
              TextSpan(
                  text: 'mami',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: ' čaj'),
            ]),
          ],
        ),
        DativLokativDeclensionTable(),
        PossessivePronounSection(
          note: N.t('longShortFormDesc'),
          contents: [
            PronounLine(
                pronoun: PronounEnum.I,
                text: NTextMulti([
                  TextSpan(text: 'Objasni '),
                  TextSpan(
                      text: 'mi ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'dativ\n'),
                  TextSpan(text: 'Objasni dativ '),
                  TextSpan(
                      text: 'meni',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: ', molim te!'),
                ])),
            PronounLine(
                pronoun: PronounEnum.You,
                text: NTextMulti([
                  TextSpan(
                      text: dialect == DialectType.Serbia
                          ? 'Ja trebao da pokažem'
                          : 'Ja trebao pokazati '),
                  TextSpan(
                      text: 'tebi',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: ' nešto\n'),
                  TextSpan(text: 'Ja '),
                  TextSpan(
                      text: 'ti',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(
                      text: dialect == DialectType.Serbia
                          ? ' trebao da pokažem nešto'
                          : ' trebao pokazati nešto'),
                ])),
            PronounLine(
                pronoun: PronounEnum.He,
                text: NTextMulti([
                  TextSpan(text: 'Poklonio sam knjigu '),
                  TextSpan(
                      text: 'njemu\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Ja '),
                  TextSpan(
                      text: 'mu ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'nešto poklonio'),
                ])),
            PronounLine(
                pronoun: PronounEnum.She,
                text: NTextMulti([
                  TextSpan(text: 'On je rekao '),
                  TextSpan(
                      text: 'njoj',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: ' nešto\n'),

                  TextSpan(text: 'Nešto '),
                  TextSpan(
                      text: 'joj',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: ' je rekao'),
                ])),
            PronounLine(
                pronoun: PronounEnum.We,
                text: NTextMulti([
                  TextSpan(text: 'Trebamo kupiti '),
                  TextSpan(
                      text: 'nama ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'auto\n'),
                  TextSpan(text: 'Pokaži '),
                  TextSpan(
                      text: 'nam ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'gdje je pekara'),
                ])),
            PronounLine(
                pronoun: PronounEnum.You_Plural,
                text: NTextMulti([
                  TextSpan(text: 'Pokažat ćemo '),
                  TextSpan(
                      text: 'vam ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'grad\n'),
                  TextSpan(text: 'Pokažat ćemo grad '),
                  TextSpan(
                      text: 'vama',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.They_Ungendered,
                text: NTextMulti([
                  TextSpan(text: 'Daj '),
                  TextSpan(
                      text: 'im ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'naše knjige\n'),
                  TextSpan(text: 'Daj naše knjige  '),
                  TextSpan(
                      text: 'njima',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.Oneself,
                text: NTextMulti([
                  TextSpan(text: 'Napravi '),
                  TextSpan(
                      text: 'si ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'kavu\n'),
                  TextSpan(text: 'Napravi kavu '),
                  TextSpan(
                      text: 'sebi',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
          ],
        ),
      ],
    );
  }
}
