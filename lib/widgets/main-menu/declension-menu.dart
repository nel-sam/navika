import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/akusativ/akuzativ.dart';
import 'package:navika/widgets/exercises/declension/all-cases.dart';
import 'package:navika/widgets/exercises/declension/dativ/dativ.dart';
import 'package:navika/widgets/exercises/declension/genitiv/genitiv.dart';
import 'package:navika/widgets/exercises/declension/instrumental/instrumental.dart';
import 'package:navika/widgets/exercises/declension/lokativ/lokativ.dart';
import 'package:navika/widgets/exercises/declension/nominativ/nominativ.dart';
import 'package:navika/widgets/exercises/declension/vokativ/vokativ.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-button.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-header.dart';

class DeclensionMenu extends StatelessWidget {
  final allCases = AllCases();
  final nom = Nominativ();
  final aku = Akuzativ();
  final inst = Instrumental();
  final lok = Lokativ();
  final dat = Dativ();
  final gen = Genitiv();
  final vok = Vokativ();

  @override
  Widget build(BuildContext context) {
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
              icon: Icons.change_circle,
              transLabel: AppLocalizations.of(context)!.cases,
              label: SbcLabels.cases,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  NMenuButton(
                    destination: allCases,
                    label: AppLocalizations.of(context)!.allCases,
                    transLabel: 'Sve padeže',
                  ),
                  NMenuButton(
                    destination: nom,
                    transLabel: 'Nominativ',
                    label: N.getCaseLabel(Cases.Nom),
                  ),
                  NMenuButton(
                    destination: aku,
                    label: AppLocalizations.of(context)!.akuzativ,
                    transLabel: 'Akuzativ',
                  ),
                  NMenuButton(
                    destination: inst,
                    label: AppLocalizations.of(context)!.instrumental,
                    transLabel: 'Instrumental',
                  ),
                  NMenuButton(
                    destination: lok,
                    label: AppLocalizations.of(context)!.lokativ,
                    transLabel: 'Lokativ',
                  ),
                  NMenuButton(
                    destination: dat,
                    label: AppLocalizations.of(context)!.dativ,
                    transLabel: 'Dativ',
                  ),
                  NMenuButton(
                    destination: gen,
                    label: AppLocalizations.of(context)!.genitiv,
                    transLabel: 'Genitiv',
                  ),
                  NMenuButton(
                    destination: vok,
                    label: AppLocalizations.of(context)!.vokativ,
                    transLabel: 'Vokativ',
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
