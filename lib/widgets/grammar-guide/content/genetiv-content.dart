import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/declension-table.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/shared/pronoun-line.dart';

// ignore: non_constant_identifier_names
Widget GenetivGrammarGuideContent(BuildContext context) {
  return Column(
    children: [
      getDescription(context),
      getDeclensionTable(),
      getPronounSection(context),
    ],
  );
}

Widget getDeclensionTable() {
  return DeclensionTable(
    masculineSingular: [
      NText([
        N.NTextSpan('Lijep'),
        N.NTextSpan('og\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezik'),
        N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    masculinePlural: [
      NText([
        N.NTextSpan('Lijep'),
        N.NTextSpan('ih\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezik'),
        N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    feminineSingular: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('e\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    femininePlural: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('ih\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    neuterSingular: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('eg\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
      ]),
    ],
    neuterPlural: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('ih\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
      ]),
    ],
  );
}

Widget getPronounSection(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [NSubHeader(text: AppLocalizations.of(context)!.pronouns)],
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
