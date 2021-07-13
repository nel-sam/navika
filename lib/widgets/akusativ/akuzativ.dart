import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class Akuzativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Akuzativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Aku,
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
