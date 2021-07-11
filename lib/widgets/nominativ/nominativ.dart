import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/case-exercises.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:provider/provider.dart';

class Nominativ extends StatelessWidget {
  final title = 'Nominativ';

  @override
  Widget build(BuildContext context) {
    final exercises = Provider.of<CaseExercises>(context);

    return CaseExercise(
      title: title,
      caseType: Cases.Nom,
      stateItems: exercises.exerciseItems[Cases.Nom]!,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Nom]!,
        caseName: title,
        description: AppLocalizations.of(context)!.nominativDescription,
        icons: [
          Icons.category_outlined,
          Icons.nature,
          Icons.people,
        ],
      ),
    );
  }
}
