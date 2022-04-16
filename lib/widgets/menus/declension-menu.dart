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
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/menu-footer.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_header.dart';

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
      appBar: N.navAppBar(context: context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AdCard(),
              Column(children: [
                NMenuHeader(
                  icon: NavIcons.cases,
                  transLabel: AppLocalizations.of(context)!.cases,
                  label: SbcLabels.cases,
                ),
                NMenuButton(
                  destination: allCases,
                  label: AppLocalizations.of(context)!.allCases,
                  transLabel: N.getCaseLabel(Cases.All),
                ),
                NMenuButton(
                  destination: nom,
                  transLabel: 'Nominativ',
                  label: N.getCaseLabel(Cases.Nom),
                ),
                NMenuButton(
                  destination: gen,
                  label: AppLocalizations.of(context)!.genitiv,
                  transLabel: N.getCaseLabel(Cases.Gen),
                ),
                NMenuButton(
                  destination: dat,
                  label: AppLocalizations.of(context)!.dativ,
                  transLabel: N.getCaseLabel(Cases.Dat),
                ),
                NMenuButton(
                  destination: aku,
                  label: AppLocalizations.of(context)!.akuzativ,
                  transLabel: N.getCaseLabel(Cases.Aku),
                ),
                NMenuButton(
                  destination: vok,
                  label: AppLocalizations.of(context)!.vokativ,
                  transLabel: N.getCaseLabel(Cases.Vok),
                ),
                NMenuButton(
                  destination: inst,
                  label: AppLocalizations.of(context)!.instrumental,
                  transLabel: N.getCaseLabel(Cases.Ins),
                ),
                NMenuButton(
                  destination: lok,
                  label: AppLocalizations.of(context)!.lokativ,
                  transLabel: N.getCaseLabel(Cases.Lok),
                ),
              ])
            ],
          ),
        ),
      ),
      persistentFooterButtons: [MenuFooter(activeIndex: 2)],
    );
  }
}
