import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:navika/utilities/navika-helpers.dart';

class Genitiv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Genitiv';

    return CaseExercise(
      title: title,
      caseType: Cases.Gen,
      imagePath: 'assets/banners/bosna.jpg',
      description: N.t(context).genitiveDescription,
    );
  }
}
