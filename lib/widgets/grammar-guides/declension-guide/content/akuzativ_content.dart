import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child_widgets/example_sentences.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child_widgets/possessive_pronoun_section.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child_widgets/pronoun_line.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/content/declension_tables/akuzativ_table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class AkuzativGrammarGuideContent extends StatelessWidget {
  final DialectType dialect;

  const AkuzativGrammarGuideContent({
    Key? key,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSerbian = dialect == DialectType.Serbia;

    return Column(
      children: [
        NTextSpan(N.t('akuzativDescription')),
        ExampleSentences(
          sentences: [
            NTextMulti([
              TextSpan(text: 'Volim '),
              TextSpan(
                  text: 'svog psa',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Vidiš li '),
              TextSpan(
                  text: 'veliku kuću',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: '?'),
            ]),
            NTextMulti([
              TextSpan(text: 'Popijmo '),
              TextSpan(
                  text: isSerbian ? 'toplo mleko ' : 'toplo mlijeko ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
          ],
        ),
        AkuzativDeclensionTable(),
        PossessivePronounSection(
          note: N.t('longShortFormDesc'),
          contents: [
            PronounLine(
                pronoun: PronounEnum.I,
                text: NTextMulti([
                  TextSpan(text: 'Čuješ li '),
                  TextSpan(
                      text: 'me?\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Čuješ li '),
                  TextSpan(
                      text: 'mene?',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.You,
                text: NTextMulti([
                  TextSpan(text: 'Volim '),
                  TextSpan(
                      text: 'te\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Ja volim '),
                  TextSpan(
                      text: 'tebe',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.He,
                text: NTextMulti([
                  TextSpan(text: 'Ona '),
                  TextSpan(
                      text: 'ga ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'voli\n'),
                  TextSpan(text: 'Ona voli '),
                  TextSpan(
                      text: 'njega',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.She,
                text: NTextMulti([
                  TextSpan(text: 'Ja '),
                  TextSpan(
                      text: 'ju ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'volim\n'),
                  TextSpan(text: 'Ja volim '),
                  TextSpan(
                      text: 'nju',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.We,
                text: NTextMulti([
                  TextSpan(text: 'Oni znaju '),
                  TextSpan(
                      text: 'nas',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.You_Plural,
                text: NTextMulti([
                  TextSpan(text: 'Mi znamo '),
                  TextSpan(
                      text: 'vas',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
              pronoun: PronounEnum.They_Ungendered,
              text: NTextMulti(
                [
                  TextSpan(text: 'Vi ne znate '),
                  TextSpan(
                      text: 'njih\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Vi '),
                  TextSpan(
                      text: 'ih ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'ne znate'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
