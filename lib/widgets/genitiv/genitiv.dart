import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Genitiv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Genitiv';

    return CaseExercise(
      title: title,
      caseType: Cases.Gen,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Gen]!,
        caseName: title,
        description: AppLocalizations.of(context)!.genitiveDescription,
        icons: [
          Icons.category_outlined,
          Icons.nature,
          Icons.people,
        ],
      ),
    );
  }
}
