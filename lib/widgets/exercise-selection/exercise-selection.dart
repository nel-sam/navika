import 'package:flutter/material.dart';
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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = isPortrait
        ? (size.height - kToolbarHeight - 24) / 9
        : (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    var buttons = <Widget>[
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
    ];

    return Expanded(
      child: GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        crossAxisCount: isPortrait ? 1 : 2,
        children: buttons,
      ),
    );
  }
}
