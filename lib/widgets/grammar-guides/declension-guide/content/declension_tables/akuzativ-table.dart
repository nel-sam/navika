import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child-widgets/declension-table.dart';

class AkuzativDeclensionTable extends StatelessWidget {
  const AkuzativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      borderedItemNote: N.t('sameAsNom'),
      showEqualItemNote: true,
      notes: [
        N.t('animateAkuzativ'),
        N.t('assibilation'),
      ],
      masculineSingular: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Star'),
        N.declensionExampleTextSpan('og\n', color: MASCULINE_COLOR),
        N.declensionExampleTextSpan('konj'),
        N.declensionExampleTextSpan('a', color: MASCULINE_COLOR),
        N.declensionExampleTextSpan('*'),
      ]),
      masculinePlural: DeclensionTableCell(
        isEqualItem: true,
        children: [
          N.declensionExampleTextSpan('Star'),
          N.declensionExampleTextSpan('e\n', color: MASCULINE_COLOR),
          N.declensionExampleTextSpan('konj'),
          N.declensionExampleTextSpan('e', color: MASCULINE_COLOR),
        ],
      ),
      feminineSingular: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Moj'),
        N.declensionExampleTextSpan('u\n', color: FEMININE_COLOR),
        N.declensionExampleTextSpan('kuć'),
        N.declensionExampleTextSpan('u', color: FEMININE_COLOR),
        N.declensionExampleTextSpan('**'),
      ]),
      femininePlural: DeclensionTableCell(
        isEqualItem: true,
        highlightItem: true,
        children: [
          N.declensionExampleTextSpan('Moj'),
          N.declensionExampleTextSpan('e\n', color: FEMININE_COLOR),
          N.declensionExampleTextSpan('kuć'),
          N.declensionExampleTextSpan('e', color: FEMININE_COLOR),
        ],
      ),
      neuterSingular: DeclensionTableCell(
        children: [
          N.declensionExampleTextSpan('Topl'),
          N.declensionExampleTextSpan('o\n', color: NEUTER_COLOR),
          N.declensionExampleTextSpan('piv'),
          N.declensionExampleTextSpan('o', color: NEUTER_COLOR),
        ],
        highlightItem: true,
      ),
      neuterPlural: DeclensionTableCell(
        children: [
          N.declensionExampleTextSpan('Topl'),
          N.declensionExampleTextSpan('a\n', color: NEUTER_COLOR),
          N.declensionExampleTextSpan('piv'),
          N.declensionExampleTextSpan('a', color: NEUTER_COLOR),
        ],
        highlightItem: true,
      ),
    );
  }
}
