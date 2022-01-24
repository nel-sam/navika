import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Akuzativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Akuzativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Aku,
      imagePath: CaseImagePaths[Cases.Aku]!,
      description: AppLocalizations.of(context)!.akuzativDescription,
      youtubeLink: RECOMMENDED_VIDEO_AKU,
    );
  }
}
