import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/grammar-guide/content/declension-tables/genitiv-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/pronoun-line.dart';

class GenitivGrammarGuideContent extends StatelessWidget {
  const GenitivGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getDescription(context),
        getExampleSentences(context),
        GenitivDeclensionTable(),
        getPossessivePronounSection(context),
      ],
    );
  }
}

Widget getPossessivePronounSection(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [
          NSubHeader(text: AppLocalizations.of(context)!.personalPronouns)
        ],
      ),
      PronounLine(
          pronoun: PronounEnum.I,
          text: NText([
            N.NTextSpan('On pleše '),
            N.NTextSpan('mene\n', isBold: true),
            N.NTextSpan('Evo '),
            N.NTextSpan('me', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Nisam spavala zbog '),
            N.NTextSpan('tebe\n', isBold: true),
            N.NTextSpan('Evo '),
            N.NTextSpan('te', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Ona stoji iza '),
            N.NTextSpan('njega\n', isBold: true),
            N.NTextSpan('Nema '),
            N.NTextSpan('ga ', isBold: true),
            N.NTextSpan('tu'),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('Ona stoji iza '),
            N.NTextSpan('nje', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('Oni su išli bez '),
            N.NTextSpan('nas', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Moj brat stoji između nas i '),
            N.NTextSpan('vas', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Bojim se '),
            N.NTextSpan('njih\n', isBold: true),
            N.NTextSpan('Ja se '),
            N.NTextSpan('ih ', isBold: true),
            N.NTextSpan('ne bojim'),
          ])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText([N.NTextSpan(AppLocalizations.of(context)!.genitiveDescription)])
    ],
  );
}

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(text: AppLocalizations.of(context)!.exampleSentences),
      NText([
        N.NTextSpan('Kraj '),
        N.NTextSpan('filma', isBold: true),
      ]),
      NText([
        N.NTextSpan('Ne mogu živjeti '),
        N.NTextSpan('bez tebe', isBold: true),
      ]),
      NText([
        N.NTextSpan('Vrh '),
        N.NTextSpan('planine', isBold: true),
      ]),
      NText([
        N.NTextSpan('Broj '),
        N.NTextSpan('telefona', isBold: true),
      ]),
      NText([
        N.NTextSpan('Ja sam '),
        N.NTextSpan('kod zuruba', isBold: true),
      ]),
      NText([
        N.NTextSpan('Pas je mokar '),
        N.NTextSpan('zbog kiše', isBold: true),
      ]),
      NText([
        N.NTextSpan('Nema '),
        N.NTextSpan('problema', isBold: true),
      ]),
    ],
  );
}
