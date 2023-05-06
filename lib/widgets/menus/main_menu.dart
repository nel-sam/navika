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
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/banners/sea.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: FONT_SIZE * 3, left: FONT_SIZE),
                child: Row(
                  children: [
                    Text(
                      APP_NAME,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'helvetica',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: FONT_SIZE * 2.5),
                    child: SettingsButton(),
                  ),
                ],
              )
            ],
          ),
        ),
        // TODO: What???
        //isBigScreen ? const SizedBox(height: FONT_SIZE * 4) : const SizedBox(),
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
    );
  }
}
