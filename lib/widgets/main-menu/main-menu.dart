import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exercise.dart';
import 'package:navika/widgets/main-menu/declension-menu.dart';
import 'package:navika/widgets/main-menu/exercise-button.dart';
import 'package:navika/widgets/main-menu/grammar-menu.dart';
import 'package:navika/widgets/main-menu/verb-menu.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: N.getScreenHeight() / 3.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: Nrs.isDarkTheme(context) ? 0.7 : 1,
              image: AssetImage('assets/banners/sea.jpg'),
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
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              ExerciseButton(
                halfWidth: true,
                destination: GrammarMenu(),
                icon: Icons.menu_book,
                label: AppLocalizations.of(context)!.grammarGuides,
                sbcLabel: SbcLabels.grammarGuide,
                imagePath: 'assets/banners/books_sm.jpg',
              ),
              ExerciseButton(
                halfWidth: true,
                destination: DeclensionMenu(),
                icon: Icons.change_circle,
                label: AppLocalizations.of(context)!.caseExercises,
                sbcLabel: SbcLabels.cases,
                imagePath: 'assets/banners/seaside_sm.jpg',
              ),
              ExerciseButton(
                halfWidth: true,
                destination: VerbMenu(),
                icon: Icons.nordic_walking,
                label: AppLocalizations.of(context)!.verbExercises,
                sbcLabel: SbcLabels.verbs,
                imagePath: 'assets/banners/vespa_sm.jpg',
              ),
              ExerciseButton(
                halfWidth: true,
                destination: CyrillicExercise(),
                icon: Icons.abc,
                label: AppLocalizations.of(context)!.cyrillic,
                sbcLabel: SbcLabels.cyrillic,
                imagePath: 'assets/banners/writing_sm.jpg',
              ),
            ],
          ),
        ),
        const AdCard(),
      ],
    );
  }
}
