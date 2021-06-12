import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/declension-table.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/shared/pronoun-line.dart';

import '../../constants.dart';

class NominativExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.NavikaAppBar(Text('Nominativ'), context, []),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              getDescription(context),
              getExampleSentences(context),
              getDeclensionTable(context),
              getPronounSection(context),
            ],
          ),
        ),
      ),
    );
  }
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
            N.NTextSpan('Da li '),
            N.NTextSpan('me ', isBold: true),
            N.NTextSpan('čuješ?\n'),
            N.NTextSpan('Da li čuješ '),
            N.NTextSpan('mene', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Volim '),
            N.NTextSpan('te\n', isBold: true),
            N.NTextSpan('Ja volim '),
            N.NTextSpan('tebe', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Ona '),
            N.NTextSpan('ga ', isBold: true),
            N.NTextSpan('voli\n'),
            N.NTextSpan('Ona voli '),
            N.NTextSpan('njega', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('Ja '),
            N.NTextSpan('ju ', isBold: true),
            N.NTextSpan('volim\n'),
            N.NTextSpan('Ja volim '),
            N.NTextSpan('nju', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('Oni znaju '),
            N.NTextSpan('nas', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Mi znamo '),
            N.NTextSpan('vas', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Vi ne znate '),
            N.NTextSpan('njih\n', isBold: true),
            N.NTextSpan('Vi '),
            N.NTextSpan('ih ', isBold: true),
            N.NTextSpan('ne znate'),
          ])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText([N.NTextSpan(AppLocalizations.of(context)!.nominativDescription)])
    ],
  );
}
