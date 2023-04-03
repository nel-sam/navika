import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/declension-guide.dart';
import 'package:navika/widgets/grammar-guides/number-guide/number-guide.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/menu-footer.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_header.dart';

class GrammarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transLabel = N.t('grammarGuides');
    final label = SbcLabels.grammarGuide;
    final icon = NavIcons.grammarGuides;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        context: context,
      ),
      body: SettingsConsumerWrapper(
        getChildWidget: (Settings settings) => SizedBox(
          width: N.getMaxScreenWidth(),
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
                      destination:
                          DeclensionGuide(dialect: settings.dialectType),
                      label: N.t('cases'),
                      transLabel: SbcLabels.cases,
                    ),
                    NMenuButton(
                      destination: NumberGuide(dialect: settings.dialectType),
                      label: N.t('numbers'),
                      transLabel: SbcLabels.numbers,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [MenuFooter(activeIndex: 1)],
    );
  }
}
