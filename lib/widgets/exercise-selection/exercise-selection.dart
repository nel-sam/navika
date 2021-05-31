import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/adjectives/adjective-exercise.dart';
import 'package:navika/widgets/akusativ/akusativ.dart';
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
            label: '${AppLocalizations.of(context)!.adjectives} (Nomativ)'),
        ExerciseButton(
            destination: Akusativ(),
            icon: Icons.remove_red_eye_outlined,
            label: 'Akusativ'),
        ExerciseButton(
            destination: Akusativ(),
            icon: Icons.handyman_outlined,
            label: 'Instrumental'),
        ExerciseButton(
            destination: Akusativ(),
            icon: Icons.location_on_outlined,
            label: 'Lokativ'),
        ExerciseButton(
            destination: Akusativ(), icon: Icons.arrow_forward, label: 'Dativ'),
        ExerciseButton(
            destination: Akusativ(),
            icon: Icons.coffee,
            label: 'Genetiv'),
        ExerciseButton(
            destination: Akusativ(),
            icon: Icons.call_rounded,
            label: 'Vokativ'),
      ],
    );
  }
}
