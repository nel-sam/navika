import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class Lokativ extends StatefulWidget {
  final List<PANCombo> listItems;

  const Lokativ({
    required this.listItems,
  });

  @override
  _LokativState createState() => _LokativState();
}

class _LokativState extends State<Lokativ> {
  final title = 'Lokativ';
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
      caseType: Cases.Lok,
      listItems: widget.listItems,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[Cases.Lok]!,
        caseName: title,
        description: AppLocalizations.of(context)!.lokativDescription,
        icons: [
          Icons.location_on_outlined,
          Icons.message,
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
