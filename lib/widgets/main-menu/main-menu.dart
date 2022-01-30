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

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        halfWidth: true,
        destination: GrammarMenu(),
        icon: Icons.menu_book,
        label: AppLocalizations.of(context)!.grammarGuides,
        imagePath: 'assets/banners/books_sm.jpg',
      ),
      ExerciseButton(
        halfWidth: true,
        destination: DeclensionMenu(),
        icon: Icons.change_circle,
        label: AppLocalizations.of(context)!.caseExercises,
        imagePath: 'assets/banners/seaside_sm.jpg',
      ),
      ExerciseButton(
        halfWidth: true,
        destination: VerbMenu(),
        icon: Icons.nordic_walking,
        label: AppLocalizations.of(context)!.verbExercises,
        imagePath: 'assets/banners/vespa_sm.jpg',
      ),
      ExerciseButton(
        halfWidth: true,
        destination: CyrillicExercise(),
        icon: Icons.abc,
        label: AppLocalizations.of(context)!.cyrillic,
        imagePath: 'assets/banners/writing_sm.jpg',
      ),
    ];

    return Column(
      children: [
        Container(
          height: N.getScreenHeight(context) / 3.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/banners/sea.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: FONT_SIZE, left: FONT_SIZE),
          child: Row(
            children: [
              Text(
                APP_NAME,
                style: TextStyle(
                    fontSize: 30, fontFamily: 'helvetica', color: ACCENT_COLOR),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: buttons,
          ),
        ),
        AdCard(),
      ],
    );
  }
}
