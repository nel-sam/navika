import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class NominativDeclensionTable extends StatelessWidget {
  const NominativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mascStyle =
        Nrs.getTextStyle(context: context, color: MASCULINE_COLOR);

    final femStyle = Nrs.getTextStyle(context: context, color: FEMININE_COLOR);

    final neutStyle = Nrs.getTextStyle(context: context, color: NEUTER_COLOR);

    return DeclensionTable(
      masculineSingular: DeclensionTableCell(children: [
        TextSpan(text: 'Lijep'),
        TextSpan(text: 'i\n', style: mascStyle),
        TextSpan(text: 'jezi'),
        TextSpan(text: 'k', style: mascStyle),
      ]),
      masculinePlural: DeclensionTableCell(children: [
        TextSpan(text: 'Lijep'),
        TextSpan(text: 'i\n', style: mascStyle),
        TextSpan(text: 'jezic'),
        TextSpan(text: 'i', style: mascStyle),
      ]),
      feminineSingular: DeclensionTableCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'a\n', style: femStyle),
        TextSpan(text: 'kuć'),
        TextSpan(text: 'a', style: femStyle),
      ]),
      femininePlural: DeclensionTableCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'e\n', style: femStyle),
        TextSpan(text: 'kuć'),
        TextSpan(text: 'e', style: femStyle),
      ]),
      neuterSingular: DeclensionTableCell(children: [
        TextSpan(text: 'Vruć'),
        TextSpan(text: 'e\n', style: neutStyle),
        TextSpan(text: 'mlijek'),
        TextSpan(text: 'o', style: neutStyle),
      ]),
      neuterPlural: DeclensionTableCell(children: [
        TextSpan(text: 'Vruć'),
        TextSpan(text: 'a\n', style: neutStyle),
        TextSpan(text: 'mlijek'),
        TextSpan(text: 'a', style: neutStyle),
      ]),
    );
  }
}
