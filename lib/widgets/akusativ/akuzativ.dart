import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/case-exercises.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:provider/provider.dart';

class Akuzativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Akuzativ';
    final exercises = Provider.of<CaseExercises>(context);

    return CaseExercise(
      title: title,
      caseType: Cases.Aku,
      stateItems: exercises.exerciseItems[Cases.Aku]!,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Aku]!,
        caseName: title,
        description: AppLocalizations.of(context)!.akuzativDescription,
        icons: [
          Icons.remove_red_eye_outlined,
          Icons.car_rental,
          Icons.arrow_forward,
          Icons.euro,
        ],
      ),
    );
  }
}
