import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table-cell.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/declension-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class InstrumentalDeclensionTable extends StatelessWidget {
  const InstrumentalDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondEqualColor = Colors.red;

    final mascStyle = Nrs.getTextStyle(
        context: context, isItalic: true, color: MASCULINE_COLOR);

    final femStyle = Nrs.getTextStyle(
        context: context, isItalic: true, color: FEMININE_COLOR);

    final neutStyle =
        Nrs.getTextStyle(context: context, isItalic: true, color: NEUTER_COLOR);

    return DeclensionTable(
      showEqualItemNote: true,
      additionalEqualItemColor: secondEqualColor,
      notes: [AppLocalizations.of(context)!.instrumentalFemSing],
      borderedItemNote: AppLocalizations.of(context)!.sameAsLok,
      masculineSingular: DeclensionTableCell(
        isEqualItem: true,
        children: [
          TextSpan(text: 'Lijep'),
          TextSpan(text: 'im\n', style: mascStyle),
          TextSpan(text: 'jezik'),
          TextSpan(text: 'om', style: mascStyle)
        ],
      ),
      masculinePlural: DeclensionTableCell(
        isEqualItem: true,
        equalItemColor: secondEqualColor,
        children: [
          TextSpan(text: 'Lijep'),
          TextSpan(text: 'im\n', style: mascStyle),
          TextSpan(text: 'jezic'),
          TextSpan(text: 'ima', style: mascStyle),
        ],
        highlightItem: true,
      ),
      feminineSingular: DeclensionTableCell(children: [
        TextSpan(text: 'Moj'),
        TextSpan(text: 'om\n', style: femStyle),
        TextSpan(text: 'kuć'),
        TextSpan(text: 'om', style: femStyle),
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
          TextSpan(text: 'im\n', style: neutStyle),
          TextSpan(text: 'mlijek'),
          TextSpan(text: 'om', style: neutStyle),
        ],
      ),
      neuterPlural: DeclensionTableCell(
        isEqualItem: true,
        equalItemColor: secondEqualColor,
        children: [
          TextSpan(text: 'Vruć'),
          TextSpan(text: 'im \n', style: neutStyle),
          TextSpan(text: 'mlijek'),
          TextSpan(text: 'ima', style: neutStyle),
        ],
        highlightItem: true,
      ),
    );
  }
}
