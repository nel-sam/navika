import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class Akuzativ extends StatefulWidget {
  final Function(SettingsSet) onSettingsSet;
  final List<PANExerciseItem> listItems;
  final SettingsSet settingsSet;

  const Akuzativ({
    required this.listItems,
    required this.settingsSet,
    required this.onSettingsSet,
  });

  @override
  _AkuzativState createState() => _AkuzativState();
}

class _AkuzativState extends State<Akuzativ> {
  final title = 'Akuzativ';

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Akuzativ,
      listItems: widget.listItems,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Akuzativ]!,
        caseName: title,
        description: AppLocalizations.of(context)!.akuzativDescription,
        icons: [
          Icons.remove_red_eye_outlined,
          Icons.car_rental,
          Icons.arrow_forward,
          Icons.euro,
        ],
      ),
      onSettingsSet: widget.onSettingsSet,
      settingsSet: widget.settingsSet,
    );
  }
}
