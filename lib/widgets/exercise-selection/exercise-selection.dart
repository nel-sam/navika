import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/akusativ/akuzativ.dart';
import 'package:navika/widgets/content-generators/akuzativ-generators.dart';
import 'package:navika/widgets/content-generators/dativ-generators.dart';
import 'package:navika/widgets/content-generators/genetiv-generators.dart';
import 'package:navika/widgets/content-generators/instrumental-generators.dart';
import 'package:navika/widgets/content-generators/lokativ-generators.dart';
import 'package:navika/widgets/content-generators/nominativ-generators.dart';
import 'package:navika/widgets/dativ/dativ.dart';
import 'package:navika/widgets/exercise-selection/exercise-button.dart';
import 'package:navika/widgets/genitiv/genitiv.dart';
import 'package:navika/widgets/grammar-guide/grammar-guide.dart';
import 'package:navika/widgets/instrumental/instrumental.dart';
import 'package:navika/widgets/lokativ/lokativ.dart';
import 'package:navika/widgets/nominativ/nominativ.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExerciseSelection extends StatefulWidget {
  @override
  _ExerciseSelectionState createState() => _ExerciseSelectionState();
}

class _ExerciseSelectionState extends State<ExerciseSelection> {
  late List<PANCombo> nomContent;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        destination: GrammarGuide(),
        icon: Icons.menu_book,
        label: AppLocalizations.of(context)!.grammarGuide,
        imagePath: 'assets/banners/books.jpg',
      ),
      ExerciseButton(
        destination: Nominativ(),
        icon: Icons.category_outlined,
        label: 'Nominativ',
        imagePath: CaseImagePaths[Cases.Nom]!,
      ),
      ExerciseButton(
          destination: Akuzativ(
          ),
          icon: Icons.remove_red_eye_outlined,
          label: 'Akuzativ',
          imagePath: CaseImagePaths[Cases.Aku]!),
      ExerciseButton(
          destination: Instrumental(
            listItems: InstrumentalGenerators.getPANCombos(settingsSet),
          ),
          icon: Icons.handyman_outlined,
          label: 'Instrumental',
          imagePath: CaseImagePaths[Cases.Ins]!),
      ExerciseButton(
          destination: Lokativ(
            listItems: LokativGenerators.getPANCombos(settingsSet),
          ),
          icon: Icons.location_on_outlined,
          label: 'Lokativ',
          imagePath: CaseImagePaths[Cases.Lok]!),
      ExerciseButton(
          destination: Dativ(
            listItems: DativGenerators.getPANCombos(settingsSet),
          ),
          icon: Icons.arrow_forward,
          label: 'Dativ',
          imagePath: CaseImagePaths[Cases.Dat]!),
      ExerciseButton(
          destination: Genitiv(
            listItems: GenetivGenerators.getPANCombos(settingsSet),
          ),
          icon: Icons.coffee,
          label: 'Genitiv',
          imagePath: CaseImagePaths[Cases.Gen]!),
      // ExerciseButton(
      //     destination: Vokativ(),
      //     icon: Icons.call_rounded,
      //     label: 'Vokativ'),
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
