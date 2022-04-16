import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';

class InstrumentalDeclensionTable extends StatelessWidget {
  const InstrumentalDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondEqualColor = Colors.red;

    return DeclensionTable(
      showEqualItemNote: true,
      additionalEqualItemColor: secondEqualColor,
      notes: [N.t(context).instrumentalFemSing],
      borderedItemNote: N.t(context).sameAsLok,
      masculineSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          N.declensionExampleTextSpan('Brz'),
          N.declensionExampleTextSpan('im\n', color: MASCULINE_COLOR),
          N.declensionExampleTextSpan('ps'),
          N.declensionExampleTextSpan('om', color: MASCULINE_COLOR)
        ],
      ),
      masculinePlural: DeclensionTableCell(
        isEqualItem: true,
        equalItemColor: secondEqualColor,
        children: [
          N.declensionExampleTextSpan('Lijep'),
          N.declensionExampleTextSpan('im\n', color: MASCULINE_COLOR),
          N.declensionExampleTextSpan('jezic'),
          N.declensionExampleTextSpan('ima', color: MASCULINE_COLOR),
        ],
        highlightItem: true,
      ),
      feminineSingular: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Moj'),
        N.declensionExampleTextSpan('om\n', color: FEMININE_COLOR),
        N.declensionExampleTextSpan('kuć'),
        N.declensionExampleTextSpan('om', color: FEMININE_COLOR),
        N.declensionExampleTextSpan('*'),
      ]),
      femininePlural: DeclensionTableCell(
        children: [
          N.declensionExampleTextSpan('Moj'),
          N.declensionExampleTextSpan('im\n', color: FEMININE_COLOR),
          N.declensionExampleTextSpan('kuć'),
          N.declensionExampleTextSpan('ama', color: FEMININE_COLOR),
        ],
        highlightItem: true,
      ),
      neuterSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          N.declensionExampleTextSpan('Vruć'),
          N.declensionExampleTextSpan('im\n', color: NEUTER_COLOR),
          N.declensionExampleTextSpan('vin'),
          N.declensionExampleTextSpan('om', color: NEUTER_COLOR),
        ],
      ),
      neuterPlural: DeclensionTableCell(
        isEqualItem: true,
        equalItemColor: secondEqualColor,
        children: [
          N.declensionExampleTextSpan('Vruć'),
          N.declensionExampleTextSpan('im \n', color: NEUTER_COLOR),
          N.declensionExampleTextSpan('vin'),
          N.declensionExampleTextSpan('ima', color: NEUTER_COLOR),
        ],
        highlightItem: true,
      ),
    );
  }
}
