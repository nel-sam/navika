import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/pronoun-line.dart';

// ignore: non_constant_identifier_names
Widget InstrumentalGrammarGuideContent(BuildContext context) {
  return Column(
    children: [
      getDescription(context),
      getDeclensionTable(),
      getPossessivePronounSection(context),
    ],
  );
}

Widget getDeclensionTable() {
  return DeclensionTable(
    masculineSingular: [
      NText([
        N.NTextSpan('Lijep'),
        N.NTextSpan('im\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezik'),
        N.NTextSpan('om', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    masculinePlural: [
      NText([
        N.NTextSpan('Lijep'),
        N.NTextSpan('im\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezic'),
        N.NTextSpan('ima', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    feminineSingular: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('om\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('om', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    femininePlural: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('im\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('ama', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    neuterSingular: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('im\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('om', isItalic: true, color: NEUTER_COLOR),
      ]),
    ],
    neuterPlural: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('im \n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('ima', isItalic: true, color: NEUTER_COLOR),
      ]),
    ],
  );
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
            N.NTextSpan('Ti ideš sa '),
            N.NTextSpan('mnom', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Ja ću pjevati s '),
            N.NTextSpan('tobom', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Ja radim zajedno s '),
            N.NTextSpan('njim', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('Josip će putovati s '),
            N.NTextSpan('njom', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('Trebaš da ideš s '),
            N.NTextSpan('nama', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Ivan mora pričati s '),
            N.NTextSpan('vama', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Zoran želi ići s '),
            N.NTextSpan('njima', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.Oneself,
          text:
              NText([N.NTextSpan('Sa '), N.NTextSpan('sobom', isBold: true)])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText(
          [N.NTextSpan(AppLocalizations.of(context)!.instrumentalDescription)]),
      YouTubeLink(context, 'https://www.youtube.com/watch?v=sOX2Z70g73Q')
    ],
  );
}
