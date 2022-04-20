import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';

class GenitivDeclensionTable extends StatelessWidget {
  const GenitivDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      notes: [N.t('softLettersOgEg')],
      showEqualItemNote: true,
      borderedItemNote: N.t('sameAsAkuz'),
      masculineSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          N.declensionExampleTextSpan('Brz'),
          N.declensionExampleTextSpan('og\n', color: MASCULINE_COLOR),
          N.declensionExampleTextSpan('ps'),
          N.declensionExampleTextSpan('a', color: MASCULINE_COLOR),
        ],
        highlightItem: true,
      ),
      masculinePlural: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Slatk'),
        N.declensionExampleTextSpan('ih\n', color: MASCULINE_COLOR),
        N.declensionExampleTextSpan('pas'),
        N.declensionExampleTextSpan('a', color: MASCULINE_COLOR),
      ]),
      feminineSingular: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Moj'),
        N.declensionExampleTextSpan('e\n', color: FEMININE_COLOR),
        N.declensionExampleTextSpan('kuć'),
        N.declensionExampleTextSpan('e', color: FEMININE_COLOR),
      ]),
      femininePlural: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Moj'),
        N.declensionExampleTextSpan('ih\n', color: FEMININE_COLOR),
        N.declensionExampleTextSpan('kuć'),
        N.declensionExampleTextSpan('a', color: FEMININE_COLOR),
      ]),
      neuterSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          N.declensionExampleTextSpan('Vruć'),
          N.declensionExampleTextSpan('eg\n', color: NEUTER_COLOR),
          N.declensionExampleTextSpan('mor'),
          N.declensionExampleTextSpan('a', color: NEUTER_COLOR),
        ],
      ),
      neuterPlural: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Vruć'),
        N.declensionExampleTextSpan('ih\n', color: NEUTER_COLOR),
        N.declensionExampleTextSpan('mor'),
        N.declensionExampleTextSpan('a', color: NEUTER_COLOR),
      ]),
    );
  }
}
