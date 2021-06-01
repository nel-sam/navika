import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/adjectives/adjective-exercise.dart';
import 'package:navika/widgets/akusativ/akuzativ.dart';
import 'package:navika/widgets/exercise-selection/exercise-button.dart';

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
            destination: AdjectivesExercise(),
            icon: Icons.category_outlined,
            label: '${AppLocalizations.of(context)!.adjectives} (Nominativ)'),
        ExerciseButton(
            destination: Akuzativ(),
            icon: Icons.remove_red_eye_outlined,
            label: 'Akuzativ'),
        ExerciseButton(
            destination: Akuzativ(),
            icon: Icons.handyman_outlined,
            label: 'Instrumental'),
        ExerciseButton(
            destination: Akuzativ(),
            icon: Icons.location_on_outlined,
            label: 'Lokativ'),
        ExerciseButton(
            destination: Akuzativ(), icon: Icons.arrow_forward, label: 'Dativ'),
        ExerciseButton(
            destination: Akuzativ(), icon: Icons.coffee, label: 'Genetiv'),
        ExerciseButton(
            destination: Akuzativ(),
            icon: Icons.call_rounded,
            label: 'Vokativ'),
      ],
    );
  }
}
