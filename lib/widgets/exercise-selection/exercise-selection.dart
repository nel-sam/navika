import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercise-selection/declension-menu.dart';
import 'package:navika/widgets/exercise-selection/exercise-button.dart';
import 'package:navika/widgets/exercise-selection/grammar-menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/exercise-selection/verb-menu.dart';

class ExerciseSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        destination: GrammarMenu(),
        icon: Icons.menu_book,
        label: AppLocalizations.of(context)!.grammarGuides,
        imagePath: 'assets/banners/books.jpg',
      ),
      ExerciseButton(
        destination: DeclensionMenu(),
        icon: Icons.group,
        label: AppLocalizations.of(context)!.cases,
        imagePath: CaseImagePaths[Cases.All]!,
      ),
      ExerciseButton(
        destination: VerbMenu(),
        icon: Icons.movie_filter,
        label: AppLocalizations.of(context)!.verbs,
        imagePath: 'assets/banners/vespa.jpg',
      ),
    ];

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: buttons,
        ),
      ),
    );
  }
}
