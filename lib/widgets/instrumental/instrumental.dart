import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/case-exercises.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Instrumental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Instrumental';
    final provider = Provider.of<CaseExercises>(context);

    return CaseExercise(
      title: title,
      caseType: Cases.Ins,
      stateItems: provider.exerciseItems[Cases.Ins]!,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Ins]!,
        caseName: title,
        description: AppLocalizations.of(context)!.instrumentalDescription,
        icons: [
          Icons.handyman_outlined,
          Icons.train,
          Icons.motorcycle,
        ],
      ),
    );
  }
}
