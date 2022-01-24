import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Instrumental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Instrumental';

    return CaseExercise(
      title: title,
      caseType: Cases.Ins,
      imagePath: CaseImagePaths[Cases.Ins]!,
      description: AppLocalizations.of(context)!.instrumentalDescription,
      youtubeLink: RECOMMENDED_VIDEO_INST,
    );
  }
}
