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
Widget NominativGrammarGuideContent(BuildContext context) {
  return Column(
    children: [
      getDescription(context),
      getExampleSentences(context),
      getDeclensionTable(context),
      getPossessivePronounSection(context),
    ],
  );
}

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(text: AppLocalizations.of(context)!.exampleSentences),
      NText([
        N.NTextSpan('Ja ', isBold: true),
        N.NTextSpan('sam '),
        N.NTextSpan('Denis', isBold: true),
      ]),
      NText([
        N.NTextSpan('Moja '),
        N.NTextSpan('žena ', isBold: true),
        N.NTextSpan('je '),
        N.NTextSpan('učiteljica', isBold: true),
      ]),
      NText([
        N.NTextSpan('Bijelo ', isBold: true),
        N.NTextSpan('kao '),
        N.NTextSpan('mlijeko', isBold: true),
      ]),
      NText([
        N.NTextSpan('Mlijeko ', isBold: true),
        N.NTextSpan('je ukusnije nego '),
        N.NTextSpan('limunada', isBold: true),
      ]),
    ],
  );
}

Widget getDeclensionTable(BuildContext context) {
  return DeclensionTable(
    masculineSingular: [
      NText([
        N.NTextSpan('Lijep'),
        N.NTextSpan('i\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezi'),
        N.NTextSpan('k', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    masculinePlural: [
      NText([
        N.NTextSpan('Lijep'),
        N.NTextSpan('i\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezic'),
        N.NTextSpan('i', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    feminineSingular: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('a\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('a', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    femininePlural: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('e\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    neuterSingular: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('e\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('o', isItalic: true, color: NEUTER_COLOR),
      ]),
    ],
    neuterPlural: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('a\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
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
            N.NTextSpan('Ja ', isBold: true),
            N.NTextSpan('sam Azat'),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Tko si '),
            N.NTextSpan('ti', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Trčim brže nego '),
            N.NTextSpan('on ', isBold: true),
            N.NTextSpan('i ti'),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('Ona ', isBold: true),
            N.NTextSpan('uči hrvatski'),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('Mi ', isBold: true),
            N.NTextSpan('plivamo skoro kao vi'),
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Da li '),
            N.NTextSpan('vi ', isBold: true),
            N.NTextSpan('pričate Engleski?'),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Oni ', isBold: true),
            N.NTextSpan('plivaju u moru'),
          ])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText([N.NTextSpan(AppLocalizations.of(context)!.nominativDescription)]),
      YouTubeLink(context, 'https://www.youtube.com/watch?v=Vj6nT2UTfH0')
    ],
  );
}
