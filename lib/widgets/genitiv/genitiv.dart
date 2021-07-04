import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Genitiv extends StatefulWidget {
  final Function(SettingsSet) onSettingsSet;
  final List<PANExerciseItem> listItems;
  final SettingsSet settingsSet;

  const Genitiv({
    required this.listItems,
    required this.settingsSet,
    required this.onSettingsSet,
  });

  @override
  _GenitivState createState() => _GenitivState();
}

class _GenitivState extends State<Genitiv> {
  final title = 'Genitiv';

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Genitiv,
      listItems: widget.listItems,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Genitiv]!,
        caseName: title,
        description: AppLocalizations.of(context)!.genitiveDescription,
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
