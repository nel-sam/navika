import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/akusativ/akuzativ.dart';
import 'package:navika/widgets/exercises/declension/all-cases.dart';
import 'package:navika/widgets/exercises/declension/dativ/dativ.dart';
import 'package:navika/widgets/exercises/declension/genitiv/genitiv.dart';
import 'package:navika/widgets/exercises/declension/instrumental/instrumental.dart';
import 'package:navika/widgets/exercises/declension/lokativ/lokativ.dart';
import 'package:navika/widgets/exercises/declension/nominativ/nominativ.dart';
import 'package:navika/widgets/exercises/declension/vokativ/vokativ.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/declension-guide.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
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
      body: SettingsConsumerWrapper(
        getChildWidget: (settings) => Center(
          child: SizedBox(
            width: N.getMaxScreenWidth(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AdCard(),
                  Column(children: [
                    NMenuHeader(
                      icon: NavIcons.cases,
                      transLabel: N.t('cases'),
                      label: SbcLabels.cases,
                    ),
                    NMenuButton(
                      destination:
                          DeclensionGuide(dialect: settings.dialectType),
                      label: N.t('declensionGuide'),
                      transLabel: SbcLabels.declensionGuide,
                    ),
                    NMenuButton(
                      destination: allCases,
                      label: N.t('allCases'),
                      transLabel: N.getCaseLabel(Cases.All),
                    ),
                    NMenuButton(
                      destination: nom,
                      transLabel: 'Nominativ',
                      label: N.getCaseLabel(Cases.Nom),
                    ),
                    NMenuButton(
                      destination: gen,
                      label: N.t('genitiv'),
                      transLabel: N.getCaseLabel(Cases.Gen),
                    ),
                    NMenuButton(
                      destination: dat,
                      label: N.t('dativ'),
                      transLabel: N.getCaseLabel(Cases.Dat),
                    ),
                    NMenuButton(
                      destination: aku,
                      label: N.t('akuzativ'),
                      transLabel: N.getCaseLabel(Cases.Aku),
                    ),
                    NMenuButton(
                      destination: vok,
                      label: N.t('vokativ'),
                      transLabel: N.getCaseLabel(Cases.Vok),
                    ),
                    NMenuButton(
                      destination: inst,
                      label: N.t('instrumental'),
                      transLabel: N.getCaseLabel(Cases.Ins),
                    ),
                    NMenuButton(
                      destination: lok,
                      label: N.t('lokativ'),
                      transLabel: N.getCaseLabel(Cases.Lok),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
      //persistentFooterButtons: [MenuFooter(activeIndex: 2)],
    );
  }
}
