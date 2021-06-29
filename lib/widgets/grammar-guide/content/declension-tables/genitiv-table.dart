import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';

class GenitivDeclensionTable extends StatelessWidget {
  const GenitivDeclensionTable({Key? key}) : super(key: key);

// TODO: Show BOTH borders
  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      notes: [AppLocalizations.of(context)!.softLettersOgEg],
      showEqualItemNote: true,
      borderedItemNote: AppLocalizations.of(context)!.sameAsAkuz,
      masculineSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          N.NTextSpan('Lijep'),
          N.NTextSpan('og', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('**\n'),
          N.NTextSpan('jezik'),
          N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
        ],
        highlightItem: true,
      ),
      masculinePlural: DeclensionTableCell(children: [
        N.NTextSpan('Lijep'),
        N.NTextSpan('ih\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezik'),
        N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
      ]),
      feminineSingular: DeclensionTableCell(children: [
        N.NTextSpan('Moj'),
        N.NTextSpan('e\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
      ]),
      femininePlural: DeclensionTableCell(children: [
        N.NTextSpan('Moj'),
        N.NTextSpan('ih\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
      ]),
      neuterSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          N.NTextSpan('Vruć'),
          N.NTextSpan('eg', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('**\n'),
          N.NTextSpan('mlijek'),
          N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
        ],
      ),
      neuterPlural: DeclensionTableCell(children: [
        N.NTextSpan('Vruć'),
        N.NTextSpan('ih\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
      ]),
    );
  }
}
