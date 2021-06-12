import 'package:flutter/material.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/declension-table.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';

import '../../constants.dart';

class InstrumentalExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.NavikaAppBar(Text('Instrumental'), context, []),
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
        NText([N.NTextSpan('Ti ideš sa '), N.NTextSpan('mnom', isBold: true)])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Ja ću pjevati s '),
          N.NTextSpan('tobom', isBold: true)
        ])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Ja radim zajedno s '),
          N.NTextSpan('njim', isBold: true)
        ])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Josip će putovati s '),
          N.NTextSpan('njom', isBold: true)
        ])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Trabaš da ideš s '),
          N.NTextSpan('nama', isBold: true)
        ])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Ivan mora pričati s '),
          N.NTextSpan('vama', isBold: true),
        ])
      ]),
      Row(children: [
        NText([
          N.NTextSpan('Zoran želi ići s '),
          N.NTextSpan('njima', isBold: true)
        ])
      ]),
      Row(children: [
        NText([N.NTextSpan('Sa '), N.NTextSpan('sobom', isBold: true)])
      ]),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText(
          [N.NTextSpan(AppLocalizations.of(context)!.instrumentalDescription)])
    ],
  );
}
