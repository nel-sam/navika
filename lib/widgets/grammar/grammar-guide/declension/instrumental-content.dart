import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/example-sentences.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/possessive-pronoun-section.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/instrumental-table.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';

class InstrumentalGrammarGuideContent extends StatelessWidget {
  const InstrumentalGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: FONT_SIZE),
              child: NTextMulti(
                  [TextSpan(text: N.t(context).instrumentalDescription)]),
            ),
            YouTubeLink(RECOMMENDED_VIDEO_INST)
          ],
        ),
        ExampleSentences(
          sentences: [
            NTextMulti([
              TextSpan(text: 'Juhu sam jeo '),
              TextSpan(
                  text: 'žlicom',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Na posao idem '),
              TextSpan(
                  text: 'autom',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Volim se baviti '),
              TextSpan(
                  text: 'sportom',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Razgovaram '),
              TextSpan(
                  text: 's prijateljem',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Idem '),
              TextSpan(
                  text: 'sa ženom',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Putujem '),
              TextSpan(
                  text: 'noću',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
          ],
        ),
        InstrumentalDeclensionTable(),
        PossessivePronounSection(
          contents: [
            PronounLine(
                pronoun: PronounEnum.I,
                text: NTextMulti([
                  TextSpan(text: 'Ti ideš sa '),
                  TextSpan(
                      text: 'mnom',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.You,
                text: NTextMulti([
                  TextSpan(text: 'Ja ću pjevati s '),
                  TextSpan(
                      text: 'tobom',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
                pronoun: PronounEnum.He,
                text: NTextMulti([
                  TextSpan(text: 'Ja radim zajedno s '),
                  TextSpan(
                      text: 'njim',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
                pronoun: PronounEnum.She,
                text: NTextMulti([
                  TextSpan(text: 'Josip će putovati s '),
                  TextSpan(
                      text: 'njom',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
                pronoun: PronounEnum.We,
                text: NTextMulti([
                  TextSpan(text: 'Treba ti da ideš s '),
                  TextSpan(
                      text: 'nama',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
                pronoun: PronounEnum.You_Plural,
                text: NTextMulti([
                  TextSpan(text: 'Ivan mora pričati s '),
                  TextSpan(
                      text: 'vama',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.They_Ungendered,
                text: NTextMulti([
                  TextSpan(text: 'Zoran želi ići s '),
                  TextSpan(
                      text: 'njima',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
                pronoun: PronounEnum.Oneself,
                text: NTextMulti([
                  TextSpan(text: 'Sa '),
                  TextSpan(
                      text: 'sobom',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
          ],
        ),
      ],
    );
  }
}
