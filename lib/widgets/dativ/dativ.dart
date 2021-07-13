import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Dat,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Dat]!,
        caseName: title,
        description: AppLocalizations.of(context)!.dativDescription,
        icons: [
          Icons.person,
          Icons.arrow_forward,
          Icons.people,
        ],
      ),
    );
  }
}
