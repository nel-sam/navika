import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Instrumental extends StatefulWidget {
  final Function(SettingsSet) onSettingsSet;
  final List<PANExerciseItem> listItems;
  final SettingsSet settingsSet;

  const Instrumental({
    required this.listItems,
    required this.settingsSet,
    required this.onSettingsSet,
  });

  @override
  _InstrumentalState createState() => _InstrumentalState();
}

class _InstrumentalState extends State<Instrumental> {
  final title = 'Instrumental';

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Instrumental,
      listItems: widget.listItems,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Instrumental]!,
        caseName: title,
        description: AppLocalizations.of(context)!.instrumentalDescription,
        icons: [
          Icons.handyman_outlined,
          Icons.train,
          Icons.motorcycle,
        ],
      ),
      onSettingsSet: widget.onSettingsSet,
      settingsSet: widget.settingsSet,
    );
  }
}
