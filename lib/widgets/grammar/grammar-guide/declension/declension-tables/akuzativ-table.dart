import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class AkuzativDeclensionTable extends StatelessWidget {
  const AkuzativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mascStyle = Nrs.getTextStyle(
        context: context, isItalic: true, color: MASCULINE_COLOR);

    final femStyle = Nrs.getTextStyle(
        context: context, isItalic: true, color: FEMININE_COLOR);

    final neutStyle =
        Nrs.getTextStyle(context: context, isItalic: true, color: NEUTER_COLOR);

    return DeclensionTable(
      borderedItemNote: AppLocalizations.of(context)!.sameAsNom,
      showEqualItemNote: true,
      notes: [
        AppLocalizations.of(context)!.animateAkuzativ,
        AppLocalizations.of(context)!.assibilation,
      ],
      masculineSingular: DeclensionTableCell(children: [
        TextSpan(text: 'Star'),
        TextSpan(text: 'og\n', style: mascStyle),
        TextSpan(text: 'prijatelj'),
        TextSpan(text: 'a', style: mascStyle),
        TextSpan(text: '*\n'),
      ]),
      masculinePlural: DeclensionTableCell(
        isEqualItem: true,
        children: [
          TextSpan(text: 'Star'),
          TextSpan(text: 'e\n', style: mascStyle),
          TextSpan(text: 'prijatel'),
          TextSpan(text: 'e', style: mascStyle),
        ],
      ),
      feminineSingular: DeclensionTableCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'u\n', style: femStyle),
        TextSpan(text: 'kuć'),
        TextSpan(text: 'u', style: femStyle),
        TextSpan(text: '**'),
      ]),
      femininePlural: DeclensionTableCell(
        isEqualItem: true,
        highlightItem: true,
        children: [
          TextSpan(text: 'Moj'),
          TextSpan(text: 'e\n', style: femStyle),
          TextSpan(text: 'kuć'),
          TextSpan(text: 'e', style: femStyle),
        ],
      ),
      neuterSingular: DeclensionTableCell(
        children: [
          TextSpan(text: 'Topl'),
          TextSpan(text: 'o\n', style: neutStyle),
          TextSpan(text: 'mlijek'),
          TextSpan(text: 'o', style: neutStyle),
        ],
        highlightItem: true,
      ),
      neuterPlural: DeclensionTableCell(
        children: [
          TextSpan(text: 'Topl'),
          TextSpan(text: 'a\n', style: neutStyle),
          TextSpan(text: 'mlijek'),
          TextSpan(text: 'a', style: neutStyle),
        ],
        highlightItem: true,
      ),
    );
  }
}
