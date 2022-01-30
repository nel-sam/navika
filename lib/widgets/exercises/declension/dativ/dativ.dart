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
      imagePath: 'assets/banners/giving.jpg',
      description: AppLocalizations.of(context)!.dativDescription,
    );
  }
}
