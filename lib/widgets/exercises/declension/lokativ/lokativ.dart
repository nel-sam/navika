import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';

class Lokativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Lokativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Lok,
      description: N.t('lokativDescription'),
    );
  }
}
