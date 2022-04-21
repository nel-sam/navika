import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';

class Dativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Dat,
      description: N.t('dativDescription'),
    );
  }
}
