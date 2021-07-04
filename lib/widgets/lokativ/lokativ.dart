import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class Lokativ extends StatefulWidget {
  final Function(SettingsSet) onSettingsSet;
  final List<PANExerciseItem> listItems;
  final SettingsSet settingsSet;

  const Lokativ({
    required this.listItems,
    required this.settingsSet,
    required this.onSettingsSet,
  });

  @override
  _LokativState createState() => _LokativState();
}

class _LokativState extends State<Lokativ> {
  final title = 'Lokativ';
  final WordBank bank = wordBank;
  var settingsSet = SettingsSet();

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Lokativ,
      listItems: widget.listItems,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Lokativ]!,
        caseName: title,
        description: AppLocalizations.of(context)!.lokativDescription,
        icons: [
          Icons.location_on_outlined,
          Icons.message,
        ],
      ),
      onSettingsSet: widget.onSettingsSet,
      settingsSet: widget.settingsSet,
    );
  }
}
