import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Genitiv extends StatefulWidget {
  final List<PANExerciseItem> listItems;

  const Genitiv({
    required this.listItems,
  });

  @override
  _GenitivState createState() => _GenitivState();
}

class _GenitivState extends State<Genitiv> {
  final title = 'Genitiv';
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
