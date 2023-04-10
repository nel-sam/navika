import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings_consumer_wrapper.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/numbers/counting/counting_exercise.dart';
import 'package:navika/widgets/exercises/numbers/ordinal/ordinal_exercise.dart';
import 'package:navika/widgets/grammar-guides/number_guide/number_guide.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad_card.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_header.dart';

class NumberMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transLabel = N.t('numbers');
    final label = SbcLabels.numbers;
    final icon = NavIcons.numbers;

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
                      destination: NumberGuide(dialect: settings.dialectType),
                      label: N.t('numberGuide'),
                      transLabel: SbcLabels.grammarGuide,
                    ),
                    NMenuButton(
                      destination: CountingExercise(),
                      label: N.t('counting'),
                      transLabel: SbcLabels.counting,
                    ),
                    NMenuButton(
                      destination: OrdinalExercise(),
                      label: N.t('ordinals'),
                      transLabel: SbcLabels.ordinalNumbers,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
