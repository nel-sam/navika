import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllCases extends StatelessWidget {
  const AllCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.allCases;

    return CaseExercise(
      title: title,
      caseType: Cases.All,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.All]!,
        caseName: title,
        description: AppLocalizations.of(context)!.allCasesDesc,
        icons: [
          Icons.group,
        ],
      ),
    );
  }
}
