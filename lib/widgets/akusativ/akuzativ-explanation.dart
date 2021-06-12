import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/declension-table.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/shared/pronoun-line.dart';

import '../../constants.dart';

class AkuzativExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.NavikaAppBar(Text('Akuzativ'), context, []),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            getDescription(context),
            getPronounSection(context),
            getDeclensionTable(),
          ],
        ),
      ),
    );
  }
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
    note: '',
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
            N.NTextSpan('Ona voli '),
            N.NTextSpan('njega', isBold: true),
          ])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText([N.NTextSpan(AppLocalizations.of(context)!.akuzativDescription)])
    ],
  );
}
