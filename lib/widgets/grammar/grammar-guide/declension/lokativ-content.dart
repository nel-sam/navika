import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/example-sentences.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/possessive-pronoun-section.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/dativ-lokativ-table.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';

class LokativGrammarGuideContent extends StatelessWidget {
  const LokativGrammarGuideContent({Key? key}) : super(key: key);

// TODO: Table spacing and overflow issues
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: FONT_SIZE),
              child: NTextMulti([TextSpan(text: N.t('lokativDescription'))]),
            ),
            YouTubeLink(RECOMMENDED_VIDEO_LOK)
          ],
        ),
        ExampleSentences(
          sentences: [
            NTextMulti([
              TextSpan(text: 'Ova priča govori '),
              TextSpan(
                  text: 'o njemu',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'On gleda film '),
              TextSpan(
                  text: 'u kinu',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Živim '),
              TextSpan(
                  text: 'u gradu',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(
                  text: 'U kuhinji ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: 'ima mnogo hrane'),
            ]),
            NTextMulti([
              TextSpan(text: 'Mi smo '),
              TextSpan(
                  text: 'u restoranu',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
          ],
        ),
        DativLokativDeclensionTable(),
        PossessivePronounSection(
          contents: [
            PronounLine(
                pronoun: PronounEnum.I,
                text: NTextMulti([
                  TextSpan(text: 'Ova knjiga je o '),
                  TextSpan(
                      text: 'meni',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.You,
                text: NTextMulti([
                  TextSpan(text: 'Ja mislim o '),
                  TextSpan(
                      text: 'tebi',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.He,
                text: NTextMulti([
                  TextSpan(text: 'Ona se brine o '),
                  TextSpan(
                      text: 'njemu',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.She,
                text: NTextMulti([
                  TextSpan(text: 'On samo priča o '),
                  TextSpan(
                      text: 'njoj',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.We,
                text: NTextMulti([
                  TextSpan(text: 'Ona kaže nešto o '),
                  TextSpan(
                      text: 'nama',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.You_Plural,
                text: NTextMulti([
                  TextSpan(text: 'Ja ne znam ništa o '),
                  TextSpan(
                      text: 'vama',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.They_Ungendered,
                text: NTextMulti([
                  TextSpan(text: 'Hoćemo govoriti o '),
                  TextSpan(
                      text: 'njima',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.Oneself,
                text: NTextMulti([
                  TextSpan(text: 'I o '),
                  TextSpan(
                      text: 'sebi ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'isto'),
                ])),
          ],
        ),
      ],
    );
  }
}
