import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';

class Genitiv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Genitiv';

    return CaseExercise(
      title: title,
      caseType: Cases.Gen,
      description: N.t('genitiveDescription'),
    );
  }
}
