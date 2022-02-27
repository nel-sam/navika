import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class DativLokativDeclensionTable extends StatelessWidget {
  const DativLokativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mascStyle = Nrs.getTextStyle(
        context: context, isItalic: true, color: MASCULINE_COLOR);

    final femStyle = Nrs.getTextStyle(
        context: context, isItalic: true, color: FEMININE_COLOR);

    final neutStyle =
        Nrs.getTextStyle(context: context, isItalic: true, color: NEUTER_COLOR);

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
          TextSpan(text: 'Lijep'),
          TextSpan(text: 'om', style: mascStyle),
          TextSpan(text: '**\n'),
          TextSpan(text: 'jezik'),
          TextSpan(text: 'u', style: mascStyle),
        ],
      ),
      masculinePlural: DeclensionTableCell(
        children: [
          TextSpan(text: 'Lijep'),
          TextSpan(text: 'im\n', style: mascStyle),
          TextSpan(text: 'jezic'),
          TextSpan(text: 'ima', style: mascStyle),
          TextSpan(text: '*'),
        ],
        highlightItem: true,
      ),
      feminineSingular: DeclensionTableCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'oj\n', style: femStyle),
        TextSpan(text: 'kuć'),
        TextSpan(text: 'i', style: femStyle),
        TextSpan(text: '*'),
      ]),
      femininePlural: DeclensionTableCell(
        children: [
          TextSpan(text: 'Moj'),
          TextSpan(text: 'im\n', style: femStyle),
          TextSpan(text: 'kuć'),
          TextSpan(text: 'ama', style: femStyle),
        ],
        highlightItem: true,
      ),
      neuterSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          TextSpan(text: 'Vruć'),
          TextSpan(text: 'em', style: neutStyle),
          TextSpan(text: '**\n'),
          TextSpan(text: 'mlijek'),
          TextSpan(text: 'u', style: neutStyle),
        ],
      ),
      neuterPlural: DeclensionTableCell(
        children: [
          TextSpan(text: 'Vruć'),
          TextSpan(text: 'im\n', style: neutStyle),
          TextSpan(text: 'mlijek'),
          TextSpan(text: 'ima', style: neutStyle),
        ],
        highlightItem: true,
      ),
    );
  }
}
