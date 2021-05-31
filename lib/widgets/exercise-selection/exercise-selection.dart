import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/adjectives/adjectives.dart';

class ExerciseSelection extends StatefulWidget {
  @override
  _ExerciseSelectionState createState() => _ExerciseSelectionState();
}

class _ExerciseSelectionState extends State<ExerciseSelection> {
  @override
  Widget build(BuildContext context) {
    final buttonStyle = OutlinedButton.styleFrom(padding: EdgeInsets.all(32.0));

    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdjectivesExercise()),
            );
          },
          style: buttonStyle,
          child: Column(
            children: [
              Icon(Icons.coffee),
              Text(AppLocalizations.of(context)!.adjectives),
            ],
          ),
        )
      ],
    );
  }
}
