import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class Nominativ extends StatefulWidget {
  final Function(SettingsSet) onSettingsSet;
  final List<PANExerciseItem> listItems;
  final SettingsSet settingsSet;

  const Nominativ({
    required this.listItems,
    required this.settingsSet,
    required this.onSettingsSet,
  });

  @override
  _NominativState createState() => _NominativState();
}

class _NominativState extends State<Nominativ> {
  final title = 'Nominativ';

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Nominativ,
      listItems: widget.listItems,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Nominativ]!,
        caseName: title,
        description: AppLocalizations.of(context)!.nominativDescription,
        icons: [
          Icons.category_outlined,
          Icons.nature,
          Icons.people,
        ],
      ),
      onSettingsSet: widget.onSettingsSet,
      settingsSet: widget.settingsSet,
    );
  }
}
