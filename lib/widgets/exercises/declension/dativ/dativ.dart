import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Dat,
      imagePath: CaseImagePaths[Cases.Dat]!,
      description: AppLocalizations.of(context)!.dativDescription,
    );
  }
}
