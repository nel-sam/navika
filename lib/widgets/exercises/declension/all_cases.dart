import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case_exercise.dart';

class AllCases extends StatelessWidget {
  const AllCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = N.t('allCases');

    return CaseExercise(
      title: title,
      caseType: Cases.All,
      description: N.t('allCasesDesc'),
    );
  }
}
