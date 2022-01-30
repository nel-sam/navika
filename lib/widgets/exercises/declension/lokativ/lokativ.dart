import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Lokativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Lokativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Lok,
      imagePath: 'assets/banners/ladies.jpg',
      description: AppLocalizations.of(context)!.lokativDescription,
    );
  }
}
