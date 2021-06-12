import 'package:flutter/material.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/declension-table.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';

import '../../constants.dart';

class GenitivExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.NavikaAppBar(Text('Genitiv'), context, []),
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
        N.NTextSpan('og ', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezik'),
        N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    masculinePlural: [
      NText([
        N.NTextSpan('Lijep'),
        N.NTextSpan('ih ', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezik'),
        N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    feminineSingular: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('e ', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    femininePlural: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('ih ', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    neuterSingular: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('eg ', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
      ]),
    ],
    neuterPlural: [
      NText([
        N.NTextSpan('Vruč'),
        N.NTextSpan('ih ', isItalic: true, color: NEUTER_COLOR),
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
      Row(children: [
        NText([N.NTextSpan('On pleše '), N.NTextSpan('mene', isBold: true)])
      ]),
      Row(children: [
        NText([N.NTextSpan('Evo '), N.NTextSpan('me', isBold: true)])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Nisam spavala zbog '),
          N.NTextSpan('tebe', isBold: true)
        ])
      ]),
      Row(children: [
        NText([N.NTextSpan('Evo '), N.NTextSpan('te', isBold: true)])
      ]),
      Row(children: [
        NText(
            [N.NTextSpan('Ona stoji iza '), N.NTextSpan('njega', isBold: true)])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Nema '),
          N.NTextSpan('ga ', isBold: true),
          N.NTextSpan('tu'),
        ])
      ]),
      Row(children: [
        NText(
            [N.NTextSpan('Oni su išli bez '), N.NTextSpan('nas', isBold: true)])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Moj brat stoji između nas i '),
          N.NTextSpan('vas', isBold: true)
        ])
      ]),
      Row(children: [
        NText([N.NTextSpan('Bojim se '), N.NTextSpan('njih', isBold: true)])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Ja se '),
          N.NTextSpan('ih ', isBold: true),
          N.NTextSpan('ne bojim'),
        ])
      ]),
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
