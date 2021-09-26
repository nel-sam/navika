import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class Lokativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Lokativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Lok,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Lok]!,
        caseName: title,
        description: AppLocalizations.of(context)!.lokativDescription,
        icons: [
          Icons.location_on_outlined,
          Icons.message,
        ],
      ),
    );
  }
}
