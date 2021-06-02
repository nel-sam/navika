import 'package:flutter/material.dart';
import 'package:navika/widgets/akusativ/akuzativ.dart';
import 'package:navika/widgets/dativ/dativ.dart';
import 'package:navika/widgets/exercise-selection/exercise-button.dart';
import 'package:navika/widgets/genitiv/genitiv.dart';
import 'package:navika/widgets/instrumental/instrumental.dart';
import 'package:navika/widgets/lokativ/lokativ.dart';
import 'package:navika/widgets/nominativ/nominativ-exercise.dart';

class ExerciseSelection extends StatefulWidget {
  @override
  _ExerciseSelectionState createState() => _ExerciseSelectionState();
}

class _ExerciseSelectionState extends State<ExerciseSelection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      children: <Widget>[
        ExerciseButton(
          destination: NominativExercise(),
          icon: Icons.category_outlined,
          label: 'Nominativ',
        ),
        ExerciseButton(
            destination: Akuzativ(),
            icon: Icons.remove_red_eye_outlined,
            label: 'Akuzativ'),
        ExerciseButton(
            destination: Instrumental(),
            icon: Icons.handyman_outlined,
            label: 'Instrumental'),
        ExerciseButton(
            destination: Lokativ(),
            icon: Icons.location_on_outlined,
            label: 'Lokativ'),
        ExerciseButton(
            destination: Dativ(), icon: Icons.arrow_forward, label: 'Dativ'),
        ExerciseButton(
            destination: Genitiv(), icon: Icons.coffee, label: 'Genetiv'),
        // ExerciseButton(
        //     destination: Akuzativ(),
        //     icon: Icons.call_rounded,
        //     label: 'Vokativ'),
      ],
    );
  }
}
