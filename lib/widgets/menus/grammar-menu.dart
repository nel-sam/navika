import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension-guide.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/menu-footer.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_header.dart';

class GrammarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transLabel = N.t(context).grammarGuides;
    final label = SbcLabels.grammarGuide;
    final icon = NavIcons.grammarGuides;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        context: context,
      ),
      body: SettingsConsumerWrapper(
        getChildWidget: (Settings settings) => Column(
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
                    destination: DeclensionGuide(dialect: settings.dialectType),
                    label: N.t(context).cases,
                    transLabel: SbcLabels.cases,
                  ),
                  // NMenuButton(
                  //   destination: Tables(),
                  //   label: N.t(context).justCaseTables,
                  //   transLabel: SbcLabels.justTables,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [MenuFooter(activeIndex: 1)],
    );
  }
}
