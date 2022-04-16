import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/example-sentences.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/possessive-pronoun-section.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/genitiv-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class GenitivGrammarGuideContent extends StatelessWidget {
  const GenitivGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NTextSpan(AppLocalizations.of(context)!.genitiveDescription),
        ExampleSentences(
          sentences: [
            NSubHeader(AppLocalizations.of(context)!.exampleSentences),
            NTextMulti([
              TextSpan(text: 'Kraj '),
              TextSpan(
                  text: 'filma',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Ne mogu živjeti '),
              TextSpan(
                  text: 'bez tebe',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Vrh '),
              TextSpan(
                  text: 'planine',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Broj '),
              TextSpan(
                  text: 'telefona',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Ja sam '),
              TextSpan(
                  text: 'kod zubara',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Pas je mokar '),
              TextSpan(
                  text: 'zbog kiše',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Nema '),
              TextSpan(
                  text: 'problema',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
          ],
        ),
        GenitivDeclensionTable(),
        PossessivePronounSection(
          contents: [
            PronounLine(
                pronoun: PronounEnum.I,
                text: NTextMulti([
                  TextSpan(text: 'On pleše '),
                  TextSpan(
                      text: 'mene\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Evo '),
                  TextSpan(
                      text: 'me',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
                pronoun: PronounEnum.You,
                text: NTextMulti([
                  TextSpan(text: 'Nisam spavala zbog '),
                  TextSpan(
                      text: 'tebe\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Evo '),
                  TextSpan(
                      text: 'te',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
                pronoun: PronounEnum.He,
                text: NTextMulti([
                  TextSpan(text: 'Ona stoji iza '),
                  TextSpan(
                      text: 'njega\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Nema '),
                  TextSpan(
                      text: 'ga ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'tu'),
                ])),
            PronounLine(
                pronoun: PronounEnum.She,
                text: NTextMulti([
                  TextSpan(text: 'Ona stoji iza '),
                  TextSpan(
                      text: 'nje',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.We,
                text: NTextMulti([
                  TextSpan(text: 'Oni su išli bez '),
                  TextSpan(
                      text: 'nas',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
                pronoun: PronounEnum.You_Plural,
                text: NTextMulti([
                  TextSpan(text: 'Moj brat stoji između nas i '),
                  TextSpan(
                      text: 'vas',
                      style: Nrs.getTextStyle(context: context, isBold: true))
                ])),
            PronounLine(
              pronoun: PronounEnum.They_Ungendered,
              text: NTextMulti(
                [
                  TextSpan(text: 'Bojim se '),
                  TextSpan(
                      text: 'njih\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Ja se '),
                  TextSpan(
                      text: 'ih ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'ne bojim'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
