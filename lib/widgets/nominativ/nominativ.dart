import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/case-exercises.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:provider/provider.dart';

class Nominativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Nominativ';

    return ChangeNotifierProvider<CaseExercises>(
      create: (context) => CaseExercises(),
      child: Consumer<CaseExercises>(
        builder: (context, model, child) => CaseExercise(
          title: title,
          caseType: Cases.Nom,
          stateItems: model.exerciseItems[Cases.Nom]!,
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
        ),
      ),
    );
  }
}
