import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/akusativ/akuzativ.dart';
import 'package:navika/widgets/all-cases.dart';
import 'package:navika/widgets/dativ/dativ.dart';
import 'package:navika/widgets/exercise-selection/exercise-button.dart';
import 'package:navika/widgets/genitiv/genitiv.dart';
import 'package:navika/widgets/instrumental/instrumental.dart';
import 'package:navika/widgets/lokativ/lokativ.dart';
import 'package:navika/widgets/nominativ/nominativ.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeclensionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        destination: AllCases(),
        icon: Icons.group,
        label: AppLocalizations.of(context)!.allCases,
        imagePath: CaseImagePaths[Cases.All]!,
      ),
      ExerciseButton(
        destination: Nominativ(),
        icon: Icons.category_outlined,
        label: N.getCaseLabel(Cases.Nom),
        imagePath: CaseImagePaths[Cases.Nom]!,
      ),
      ExerciseButton(
          destination: Akuzativ(),
          icon: Icons.remove_red_eye_outlined,
          label: 'Akuzativ',
          imagePath: CaseImagePaths[Cases.Aku]!),
      ExerciseButton(
          destination: Instrumental(),
          icon: Icons.handyman_outlined,
          label: 'Instrumental',
          imagePath: CaseImagePaths[Cases.Ins]!),
      ExerciseButton(
          destination: Lokativ(),
          icon: Icons.location_on_outlined,
          label: 'Lokativ',
          imagePath: CaseImagePaths[Cases.Lok]!),
      ExerciseButton(
          destination: Dativ(),
          icon: Icons.arrow_forward,
          label: 'Dativ',
          imagePath: CaseImagePaths[Cases.Dat]!),
      ExerciseButton(
          destination: Genitiv(),
          icon: Icons.coffee,
          label: 'Genitiv',
          imagePath: CaseImagePaths[Cases.Gen]!),
      // ExerciseButton(
      //     destination: Vokativ(),
      //     icon: Icons.call_rounded,
      //     label: 'Vokativ'),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.NavikaAppBar(
          Text(
            AppLocalizations.of(context)!.cases,
            style: TextStyle(
                fontSize: 30, fontFamily: 'helvetica', color: ACCENT_COLOR),
          ),
          context,
          []),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: buttons,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
