import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';

class DativLokativDDeclensionTable extends StatelessWidget {
  const DativLokativDDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      note: AppLocalizations.of(context)!.assibilation,
      coloredItemNote: AppLocalizations.of(context)!.sameAsInst,
      masculineSingular: DeclensionTableCell(children: [
        N.NTextSpan('Lijep'),
        N.NTextSpan('om\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('jezik'),
        N.NTextSpan('u', isItalic: true, color: MASCULINE_COLOR),
      ]),
      masculinePlural: DeclensionTableCell(
        children: [
          N.NTextSpan('Lijep'),
          N.NTextSpan('im\n', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('jezic'),
          N.NTextSpan('ima', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('**'),
        ],
        backgroundColor: Colors.grey,
      ),
      feminineSingular: DeclensionTableCell(children: [
        N.NTextSpan('Moj'),
        N.NTextSpan('oj\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('i', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('**'),
      ]),
      femininePlural: DeclensionTableCell(
        children: [
          N.NTextSpan('Moj'),
          N.NTextSpan('im\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('ama', isItalic: true, color: FEMININE_COLOR),
        ],
        backgroundColor: Colors.grey,
      ),
      neuterSingular: DeclensionTableCell(children: [
        N.NTextSpan('Vruć'),
        N.NTextSpan('em\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('u', isItalic: true, color: NEUTER_COLOR),
      ]),
      neuterPlural: DeclensionTableCell(
        children: [
          N.NTextSpan('Vruć'),
          N.NTextSpan('im\n', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('mlijek'),
          N.NTextSpan('ima', isItalic: true, color: NEUTER_COLOR),
        ],
        backgroundColor: Colors.grey,
      ),
    );
  }
}
