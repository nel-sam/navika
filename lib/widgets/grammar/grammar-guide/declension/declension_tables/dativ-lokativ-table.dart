import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';

class DativLokativDeclensionTable extends StatelessWidget {
  const DativLokativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      notes: [
        AppLocalizations.of(context)!.assibilation,
        AppLocalizations.of(context)!.softLettersOmEm,
      ],
      showEqualItemNote: true,
      borderedItemNote: AppLocalizations.of(context)!.sameAsInst,
      masculineSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          N.declensionExampleTextSpan('Brz'),
          N.declensionExampleTextSpan('om\n', color: MASCULINE_COLOR),
          N.declensionExampleTextSpan('ps'),
          N.declensionExampleTextSpan('u', color: MASCULINE_COLOR),
        ],
      ),
      masculinePlural: DeclensionTableCell(
        children: [
          N.declensionExampleTextSpan('Brz'),
          N.declensionExampleTextSpan('im\n', color: MASCULINE_COLOR),
          N.declensionExampleTextSpan('ps'),
          N.declensionExampleTextSpan('ima', color: MASCULINE_COLOR),
          N.declensionExampleTextSpan('*'),
        ],
        highlightItem: true,
      ),
      feminineSingular: DeclensionTableCell(children: [
        N.declensionExampleTextSpan('Moj'),
        N.declensionExampleTextSpan('oj\n', color: FEMININE_COLOR),
        N.declensionExampleTextSpan('kuć'),
        N.declensionExampleTextSpan('i', color: FEMININE_COLOR),
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
          N.declensionExampleTextSpan('em\n', color: NEUTER_COLOR),
          N.declensionExampleTextSpan('mor'),
          N.declensionExampleTextSpan('u', color: NEUTER_COLOR),
        ],
      ),
      neuterPlural: DeclensionTableCell(
        children: [
          N.declensionExampleTextSpan('Crn'),
          N.declensionExampleTextSpan('im\n', color: NEUTER_COLOR),
          N.declensionExampleTextSpan('mor'),
          N.declensionExampleTextSpan('ima', color: NEUTER_COLOR),
        ],
        highlightItem: true,
      ),
    );
  }
}
