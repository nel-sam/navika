import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/declension-table.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/shared/pronoun-line.dart';

import '../../constants.dart';

class LokativExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.NavikaAppBar(Text('Lokativ'), context, []),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              getDescription(context),
              //getExampleSentences(context),
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
  // TODO: These are not in nominative
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
        N.NTextSpan('om\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezik'),
        N.NTextSpan('u', isItalic: true, color: MASCULINE_COLOR),
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
        N.NTextSpan('oj\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('i', isItalic: true, color: FEMININE_COLOR),
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
        N.NTextSpan('em\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('u', isItalic: true, color: NEUTER_COLOR),
      ]),
    ],
    neuterPlural: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('im\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('ima', isItalic: true, color: NEUTER_COLOR),
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
            N.NTextSpan('Ova knjiga je o '),
            N.NTextSpan('meni', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Ja mislim o '),
            N.NTextSpan('tebi', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Ona se brini o '),
            N.NTextSpan('njemu', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('On samo priča o '),
            N.NTextSpan('njoj', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('A ona uvijek kaže nešto o '),
            N.NTextSpan('nama', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Ja ne znam ništa o '),
            N.NTextSpan('vama', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Hoćemo govoriti o '),
            N.NTextSpan('njima', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.Oneself,
          text: NText([
            N.NTextSpan('I o '),
            N.NTextSpan('sebi ', isBold: true),
            N.NTextSpan('isto'),
          ])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText([N.NTextSpan(AppLocalizations.of(context)!.lokativDescription)])
    ],
  );
}
