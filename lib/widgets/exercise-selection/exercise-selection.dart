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
import 'package:navika/extensions.dart';

class ExerciseSelection extends StatefulWidget {
  @override
  _ExerciseSelectionState createState() => _ExerciseSelectionState();
}

class _ExerciseSelectionState extends State<ExerciseSelection> {
  var settingsSet = SettingsSet();
  late List<PANExerciseItem> nomContent;

  @override
  initState() {
    print('initState');
    nomContent = NominativGenerators.getPANCombos(settingsSet);
    super.initState();
  }

  onSettingsSet(SettingsSet newSettingsSet) {
    setState(() {
      settingsSet = newSettingsSet;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(nomContent[0].noun != null ? nomContent[0].noun!.dictionary : '');

    var buttons = <Widget>[
      ExerciseButton(
        destination: GrammarGuide(),
        icon: Icons.menu_book,
        label: AppLocalizations.of(context)!.grammarGuide,
        imagePath: 'assets/banners/books.jpg',
      ),
      ExerciseButton(
        destination: Nominativ(
          listItems: nomContent,
          settingsSet: settingsSet,
          onSettingsSet: onSettingsSet,
          refreshFunction: () => setState(() {
            nomContent =
                NominativGenerators.getPANCombos(settingsSet).shufflePAN();
          }),
        ),
        icon: Icons.category_outlined,
        label: 'Nominativ',
        imagePath: CaseImagePaths[CaseTypeEnum.Nominativ]!,
      ),
      ExerciseButton(
          destination: Akuzativ(
            listItems: AkuzativGenerators.getPANCombos(settingsSet),
            settingsSet: settingsSet,
            onSettingsSet: onSettingsSet,
            refreshFunction: () => {setState(() => {})},
          ),
          icon: Icons.remove_red_eye_outlined,
          label: 'Akuzativ',
          imagePath: CaseImagePaths[CaseTypeEnum.Akuzativ]!),
      ExerciseButton(
          destination: Instrumental(
            listItems: InstrumentalGenerators.getPANCombos(settingsSet),
            settingsSet: settingsSet,
            onSettingsSet: onSettingsSet,
            refreshFunction: () => {setState(() => {})},
          ),
          icon: Icons.handyman_outlined,
          label: 'Instrumental',
          imagePath: CaseImagePaths[CaseTypeEnum.Instrumental]!),
      ExerciseButton(
          destination: Lokativ(
            listItems: LokativGenerators.getPANCombos(settingsSet),
            settingsSet: settingsSet,
            onSettingsSet: onSettingsSet,
            refreshFunction: () => {setState(() => {})},
          ),
          icon: Icons.location_on_outlined,
          label: 'Lokativ',
          imagePath: CaseImagePaths[CaseTypeEnum.Lokativ]!),
      ExerciseButton(
          destination: Dativ(
            listItems: DativGenerators.getPANCombos(settingsSet),
            settingsSet: settingsSet,
            onSettingsSet: onSettingsSet,
            refreshFunction: () => {setState(() => {})},
          ),
          icon: Icons.arrow_forward,
          label: 'Dativ',
          imagePath: CaseImagePaths[CaseTypeEnum.Dativ]!),
      ExerciseButton(
          destination: Genitiv(
            listItems: GenetivGenerators.getPANCombos(settingsSet),
            settingsSet: settingsSet,
            onSettingsSet: onSettingsSet,
            refreshFunction: () => {setState(() => {})},
          ),
          icon: Icons.coffee,
          label: 'Genitiv',
          imagePath: CaseImagePaths[CaseTypeEnum.Genitiv]!),
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
