import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';

class AkuzativDeclensionTable extends StatelessWidget {
  const AkuzativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      borderedItemNote: AppLocalizations.of(context)!.sameAsNom,
      notes: [AppLocalizations.of(context)!.animateAkuzativ],
      masculineSingular: DeclensionTableCell(children: [
        N.NTextSpan('Star'),
        N.NTextSpan('og\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('prijatelj'),
        N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('*\n'),
      ]),
      masculinePlural: DeclensionTableCell(children: [
        N.NTextSpan('Star'),
        N.NTextSpan('e\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('prijatel'),
        N.NTextSpan('e', isItalic: true, color: MASCULINE_COLOR),
      ]),
      feminineSingular: DeclensionTableCell(children: [
        N.NTextSpan('Moj'),
        N.NTextSpan('u\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('u', isItalic: true, color: FEMININE_COLOR),
      ]),
      femininePlural: DeclensionTableCell(
        highlightItem: true,
        children: [
          N.NTextSpan('Moj'),
          N.NTextSpan('e\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
        ],
      ),
      neuterSingular: DeclensionTableCell(
        children: [
          N.NTextSpan('Topl'),
          N.NTextSpan('o\n', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('mlijek'),
          N.NTextSpan('o', isItalic: true, color: NEUTER_COLOR),
        ],
        highlightItem: true,
      ),
      neuterPlural: DeclensionTableCell(
        children: [
          N.NTextSpan('Topl'),
          N.NTextSpan('a\n', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('mlijek'),
          N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
        ],
        highlightItem: true,
      ),
    );
  }
}
