import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class Akuzativ extends StatelessWidget {
  final title = 'Akuzativ';
  late SettingsSet settingsSet;
  
  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: Cases.Aku,
      listItems: widget.listItems,
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
      onSettingsSet: onSettingsSet,
      settingsSet: settingsSet,
      refreshFunction: () => {
        setState(() {
          widget.listItems.shuffle();
        })
      },
    );
  }
}
