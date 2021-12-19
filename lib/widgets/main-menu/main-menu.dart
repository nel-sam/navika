import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/main-menu/declension-menu.dart';
import 'package:navika/widgets/main-menu/exercise-button.dart';
import 'package:navika/widgets/main-menu/grammar-menu.dart';
import 'package:navika/widgets/main-menu/verb-menu.dart';

class MainMenu extends StatelessWidget {
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
        icon: Icons.change_circle,
        label: AppLocalizations.of(context)!.cases,
        imagePath: CaseImagePaths[Cases.All]!,
      ),
      ExerciseButton(
        destination: VerbMenu(),
        icon: Icons.nordic_walking,
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
