import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class InstrumentalDeclensionTable extends StatelessWidget {
  const InstrumentalDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      note: AppLocalizations.of(context)!.instrumentalFemSing,
      borderedItemNote: AppLocalizations.of(context)!.sameAsLok,
      masculineSingular: [
        NText([
          N.NTextSpan('Lijep'),
          N.NTextSpan('im\n', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('jezik'),
          N.NTextSpan('om', isItalic: true, color: MASCULINE_COLOR),
        ]),
      ],
      masculinePlural: [
        NText(
          [
            N.NTextSpan('Lijep'),
            N.NTextSpan('im\n', isItalic: true, color: MASCULINE_COLOR),
            N.NTextSpan('jezic'),
            N.NTextSpan('ima', isItalic: true, color: MASCULINE_COLOR),
          ],
          showborder: true,
        ),
      ],
      feminineSingular: [
        NText([
          N.NTextSpan('Moj'),
          N.NTextSpan('om\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('om', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('**'),
        ]),
      ],
      femininePlural: [
        NText(
          [
            N.NTextSpan('Moj'),
            N.NTextSpan('im\n', isItalic: true, color: FEMININE_COLOR),
            N.NTextSpan('kuć'),
            N.NTextSpan('ama', isItalic: true, color: FEMININE_COLOR),
          ],
          showborder: true,
        ),
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
        NText(
          [
            N.NTextSpan('Vruč'),
            N.NTextSpan('im \n', isItalic: true, color: NEUTER_COLOR),
            N.NTextSpan('mlijek'),
            N.NTextSpan('ima', isItalic: true, color: NEUTER_COLOR),
          ],
          showborder: true,
        ),
      ],
    );
  }
}
