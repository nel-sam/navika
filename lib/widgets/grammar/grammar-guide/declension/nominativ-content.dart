import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/example-sentences.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/possessive-pronoun-section.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/nominativ-table.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';

class NominativGrammarGuideContent extends StatelessWidget {
  final DialectType dialect;

  const NominativGrammarGuideContent({
    Key? key,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSerbian = dialect == DialectType.Serbia;

    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: FONT_SIZE),
              child: NTextMulti([TextSpan(text: N.t('nominativDescription'))]),
            ),
            YouTubeLink(RECOMMENDED_VIDEO_NOM)
          ],
        ),
        ExampleSentences(
          sentences: [
            NTextMulti([
              TextSpan(
                  text: 'Ja ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: 'sam '),
              TextSpan(
                  text: 'Denis',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Moja '),
              TextSpan(
                  text: 'žena ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: 'je '),
              TextSpan(
                  text: 'učiteljica',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(
                  text: isSerbian ? 'Belo je ' : 'Bijelo je ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: 'kao '),
              TextSpan(
                  text: isSerbian ? 'mleko' : 'mlijeko',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti(
              [
                TextSpan(
                    text: isSerbian ? 'Mleko' : 'Mlijeko ',
                    style: Nrs.getTextStyle(context: context, isBold: true)),
                TextSpan(text: 'je ukusnije nego '),
                TextSpan(
                    text: 'limunada',
                    style: Nrs.getTextStyle(context: context, isBold: true)),
              ],
            ),
          ],
        ),
        NominativDeclensionTable(dialect: dialect),
        PossessivePronounSection(
          contents: [
            PronounLine(
                pronoun: PronounEnum.I,
                text: NTextMulti([
                  TextSpan(
                      text: 'Ja ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'sam Azat'),
                ])),
            PronounLine(
                pronoun: PronounEnum.You,
                text: NTextMulti([
                  TextSpan(text: 'Tko si '),
                  TextSpan(
                      text: 'ti',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.He,
                text: NTextMulti([
                  TextSpan(
                      text: 'On ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'je Bosanac'),
                ])),
            PronounLine(
                pronoun: PronounEnum.She,
                text: NTextMulti([
                  TextSpan(
                      text: 'Ona ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'uči hrvatski'),
                ])),
            PronounLine(
                pronoun: PronounEnum.We,
                text: NTextMulti([
                  TextSpan(
                      text: 'Mi ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'plivamo'),
                ])),
            PronounLine(
                pronoun: PronounEnum.You_Plural,
                text: NTextMulti([
                  TextSpan(text: 'Govorite li '),
                  TextSpan(
                      text: 'vi ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Engleski?'),
                ])),
            PronounLine(
              pronoun: PronounEnum.They_Ungendered,
              text: NTextMulti(
                [
                  TextSpan(
                      text: 'Oni ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'plivaju u moru'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
