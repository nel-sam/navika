import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exercise.dart';
import 'package:navika/widgets/menus/declension-menu.dart';
import 'package:navika/widgets/menus/grammar-menu.dart';
import 'package:navika/widgets/menus/verb-menu.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-button.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Nrs.getScreenHeight() / 3.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: Nrs.isDarkTheme(context) ? 0.7 : 1,
              image: AssetImage(
                'assets/banners/sea.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: FONT_SIZE * 3, left: FONT_SIZE),
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
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                NMenuButton(
                  destination: GrammarMenu(),
                  label: AppLocalizations.of(context)!.grammarGuides,
                  transLabel: SbcLabels.grammarGuide,
                ),
                NMenuButton(
                  destination: DeclensionMenu(),
                  label: AppLocalizations.of(context)!.caseExercises,
                  transLabel: SbcLabels.cases,
                ),
                NMenuButton(
                  destination: VerbMenu(),
                  label: AppLocalizations.of(context)!.verbExercises,
                  transLabel: SbcLabels.verbs,
                ),
                NMenuButton(
                  destination: CyrillicExercise(),
                  label: AppLocalizations.of(context)!.cyrillic,
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
