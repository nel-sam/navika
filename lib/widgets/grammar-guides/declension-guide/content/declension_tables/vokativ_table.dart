import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child_widgets/declension_table_cell.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/child_widgets/declension_table.dart';

class VokativDeclensionTable extends StatelessWidget {
  const VokativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      borderedItemNote: N.t('sameAsNom'),
      notes: [N.t('mascSingVok')],
      masculineSingular: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Pošten'),
        N.declensionExampleTextSpan('i\n', color: MASCULINE_COLOR),
        N.declensionExampleTextSpan('čovječ'),
        N.declensionExampleTextSpan('e*', color: MASCULINE_COLOR),
      ]),
      masculinePlural: DeclensionTableCell(
        highlightItem: true,
        children: [N.declensionExampleTextSpan('Glasni\ndečki!')],
      ),
      feminineSingular: DeclensionTableCell(
        children: [
          N.declensionExampleTextSpan('Draga\n'),
          N.declensionExampleTextSpan('Žen'),
          N.declensionExampleTextSpan('o', color: FEMININE_COLOR),
          N.declensionExampleTextSpan('!'),
        ],
      ),
      femininePlural: DeclensionTableCell(
        highlightItem: true,
        children: [N.declensionExampleTextSpan('Drage\nžene!')],
      ),
      neuterSingular: DeclensionTableCell(
        highlightItem: true,
        children: [N.declensionExampleTextSpan('Plavo\nmore!')],
      ),
      neuterPlural: DeclensionTableCell(
        highlightItem: true,
        children: [N.declensionExampleTextSpan('Plava\nmora!')],
      ),
    );
  }
}
