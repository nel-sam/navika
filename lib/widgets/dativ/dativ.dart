import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dativ extends StatefulWidget {
  final List<PANCombo> listItems;

  const Dativ({
    required this.listItems,
  });

  @override
  _DativState createState() => _DativState();
}

class _DativState extends State<Dativ> {
  final title = 'Dativ';
  late SettingsSet settingsSet;

  @override
  initState() {
    settingsSet = SettingsSet();
    super.initState();
  }

  onSettingsSet(SettingsSet newSettingsSet) =>
      setState(() => settingsSet = newSettingsSet);

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Dativ,
      listItems: widget.listItems,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Dativ]!,
        caseName: title,
        description: AppLocalizations.of(context)!.dativDescription,
        icons: [
          Icons.person,
          Icons.arrow_forward,
          Icons.people,
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
