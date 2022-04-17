import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/past-tense/past-tense.dart';
import 'package:navika/widgets/exercises/verbs/present-tense/present-tense.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/menu-footer.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_header.dart';

class VerbMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        context: context,
      ),
      body: SettingsConsumerWrapper(
        getChildWidget: (settings) => Center(
          child: Column(
            children: [
              const AdCard(),
              NMenuHeader(
                icon: NavIcons.verbs,
                transLabel: N.t(context).verbs,
                label: SbcLabels.verbs,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      NMenuButton(
                        destination: PresentTense(
                          dialect: settings.dialectType,
                        ),
                        label: N.t(context).presentTense,
                        transLabel: 'Sadašnje vrijeme',
                      ),
                      NMenuButton(
                        destination: PastTense(
                          dialect: settings.dialectType,
                        ),
                        label: N.t(context).pastTense,
                        transLabel: 'Prošlo vrijeme',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [MenuFooter(activeIndex: 3)],
    );
  }
}
