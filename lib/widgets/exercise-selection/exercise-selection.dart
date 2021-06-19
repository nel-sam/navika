import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/akusativ/akuzativ.dart';
import 'package:navika/widgets/dativ/dativ.dart';
import 'package:navika/widgets/exercise-selection/exercise-button.dart';
import 'package:navika/widgets/genitiv/genitiv.dart';
import 'package:navika/widgets/instrumental/instrumental.dart';
import 'package:navika/widgets/lokativ/lokativ.dart';
import 'package:navika/widgets/nominativ/nominativ.dart';

class ExerciseSelection extends StatefulWidget {
  @override
  _ExerciseSelectionState createState() => _ExerciseSelectionState();
}

class _ExerciseSelectionState extends State<ExerciseSelection> {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        destination: NominativExercise(),
        icon: Icons.category_outlined,
        label: 'Nominativ',
        imagePath: CaseImagePaths[CaseTypeEnum.Nominativ]!,
      ),
      ExerciseButton(
          destination: Akuzativ(),
          icon: Icons.remove_red_eye_outlined,
          label: 'Akuzativ',
          imagePath: CaseImagePaths[CaseTypeEnum.Akuzativ]!),
      ExerciseButton(
          destination: Instrumental(),
          icon: Icons.handyman_outlined,
          label: 'Instrumental',
          imagePath: CaseImagePaths[CaseTypeEnum.Instrumental]!),
      ExerciseButton(
          destination: Lokativ(),
          icon: Icons.location_on_outlined,
          label: 'Lokativ',
          imagePath: CaseImagePaths[CaseTypeEnum.Lokativ]!),
      ExerciseButton(
        destination: Dativ(),
        icon: Icons.arrow_forward,
        label: 'Dativ',
        imagePath: CaseImagePaths[CaseTypeEnum.Dativ]!,
      ),
      ExerciseButton(
        destination: Genitiv(),
        icon: Icons.coffee,
        label: 'Genetiv',
        imagePath: CaseImagePaths[CaseTypeEnum.Genitiv]!,
      ),
      // ExerciseButton(
      //     destination: Akuzativ(),
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
