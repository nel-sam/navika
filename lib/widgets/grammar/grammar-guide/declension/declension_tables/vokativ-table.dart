import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';

class VokativDeclensionTable extends StatelessWidget {
  const VokativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      borderedItemNote: N.t('sameAsNom'),
      notes: [N.t('mascSingVok')],
      masculineSingular: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Velik'),
        N.declensionExampleTextSpan('i\n', color: MASCULINE_COLOR),
        N.declensionExampleTextSpan('čovječ'),
        N.declensionExampleTextSpan('e*', color: MASCULINE_COLOR),
      ]),
      masculinePlural: DeclensionTableCell(
        children: [],
      ),
      feminineSingular: DeclensionTableCell(
        children: [],
      ),
      femininePlural: DeclensionTableCell(
        children: [],
      ),
      neuterSingular: DeclensionTableCell(
        children: [],
      ),
      neuterPlural: DeclensionTableCell(
        children: [],
      ),
    );
  }
}
