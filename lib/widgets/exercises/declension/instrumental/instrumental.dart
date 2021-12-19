import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Instrumental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Instrumental';

    return CaseExercise(
      title: title,
      caseType: Cases.Ins,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Ins]!,
        caseName: title,
        description: AppLocalizations.of(context)!.instrumentalDescription,
        youtubeLink: RECOMMENDED_VIDEO_INST,
        icons: [
          Icons.handyman_outlined,
          Icons.train,
          Icons.motorcycle,
        ],
      ),
    );
  }
}
