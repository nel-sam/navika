import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension-guide.dart';
import 'package:navika/widgets/grammar/grammar-guide/tables.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-button.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-header.dart';

class GrammarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transLabel = AppLocalizations.of(context)!.grammarGuides;
    final label = SbcLabels.grammarGuide;
    final icon = Icons.menu_book;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(
        context: context,
      ),
      body: Center(
        child: Column(
          children: [
            const AdCard(),
            NMenuHeader(
              icon: icon,
              transLabel: transLabel,
              label: label,
            ),
            Expanded(
              child: Column(
                children: [
                  NMenuButton(
                    destination: DeclensionGuide(),
                    label: AppLocalizations.of(context)!.cases,
                    transLabel: SbcLabels.cases,
                  ),
                  NMenuButton(
                    destination: Tables(),
                    label: AppLocalizations.of(context)!.justCaseTables,
                    transLabel: SbcLabels.justTables,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
