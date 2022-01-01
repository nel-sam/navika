import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class Vokativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = N.getCaseLabel(Cases.Vok);

    return CaseExercise(
      title: title,
      caseType: Cases.Vok,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Vok]!,
        caseName: title,
        description: AppLocalizations.of(context)!.vokativDescription,
        //youtubeLink: RECOMMENDED_VIDEO_VOK,
        icons: [
          Icons.phone,
        ],
      ),
    );
  }
}
