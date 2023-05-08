import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic_exercise.dart';
import 'package:navika/widgets/menus/declension_menu.dart';
import 'package:navika/widgets/menus/number_menu.dart';
import 'package:navika/widgets/menus/verb_menu.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad_card.dart';
import 'package:navika/widgets/shared/settings_button.dart';
import 'package:nrs_flutter_lib/widgets/n_hero_banner.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            NHeroBanner(
                imagePath: 'assets/banners/sea.jpg',
                appName: APP_NAME,
                rightWidget: SettingsButton()),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NMenuButton(
                      destination: DeclensionMenu(),
                      label: N.t('caseExercises'),
                      transLabel: SbcLabels.cases,
                    ),
                    NMenuButton(
                      destination: VerbMenu(),
                      label: N.t('verbExercises'),
                      transLabel: SbcLabels.verbs,
                    ),
                    NMenuButton(
                      destination: NumberMenu(),
                      label: N.t('numbers'),
                      transLabel: SbcLabels.numbers,
                    ),
                    NMenuButton(
                      destination: CyrillicExercise(),
                      label: N.t('cyrillic'),
                      transLabel: SbcLabels.cyrillic,
                    ),
                  ],
                ),
              ),
            ),
            const AdCard(),
          ],
        ),
      ),
    );
  }
}
