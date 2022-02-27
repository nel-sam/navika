import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class GenitivDeclensionTable extends StatelessWidget {
  const GenitivDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mascStyle = Nrs.getTextStyle(
        context: context, isItalic: true, color: MASCULINE_COLOR);

    final femStyle = Nrs.getTextStyle(
        context: context, isItalic: true, color: FEMININE_COLOR);

    final neutStyle =
        Nrs.getTextStyle(context: context, isItalic: true, color: NEUTER_COLOR);

    return DeclensionTable(
      notes: [AppLocalizations.of(context)!.softLettersOgEg],
      showEqualItemNote: true,
      borderedItemNote: AppLocalizations.of(context)!.sameAsAkuz,
      masculineSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          TextSpan(text: 'Lijep'),
          TextSpan(text: 'og', style: mascStyle),
          TextSpan(text: '*\n'),
          TextSpan(text: 'jezik'),
          TextSpan(text: 'a', style: mascStyle),
        ],
        highlightItem: true,
      ),
      masculinePlural: DeclensionTableCell(children: [
        TextSpan(text: 'Lijep'),
        TextSpan(text: 'ih\n', style: mascStyle),
        TextSpan(text: 'jezik'),
        TextSpan(text: 'a', style: mascStyle),
      ]),
      feminineSingular: DeclensionTableCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'e\n', style: femStyle),
        TextSpan(text: 'kuć'),
        TextSpan(text: 'e', style: femStyle),
      ]),
      femininePlural: DeclensionTableCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'ih\n', style: femStyle),
        TextSpan(text: 'kuć'),
        TextSpan(text: 'a', style: femStyle),
      ]),
      neuterSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          TextSpan(text: 'Vruć'),
          TextSpan(text: 'eg', style: neutStyle),
          TextSpan(text: '*\n'),
          TextSpan(text: 'mlijek'),
          TextSpan(text: 'a', style: neutStyle),
        ],
      ),
      neuterPlural: DeclensionTableCell(children: [
        TextSpan(text: 'Vruć'),
        TextSpan(text: 'ih\n', style: neutStyle),
        TextSpan(text: 'mlijek'),
        TextSpan(text: 'a', style: neutStyle),
      ]),
    );
  }
}
