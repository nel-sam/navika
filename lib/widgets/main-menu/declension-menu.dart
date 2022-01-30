import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/akusativ/akuzativ.dart';
import 'package:navika/widgets/exercises/declension/all-cases.dart';
import 'package:navika/widgets/exercises/declension/dativ/dativ.dart';
import 'package:navika/widgets/exercises/declension/nominativ/nominativ.dart';
import 'package:navika/widgets/exercises/declension/genitiv/genitiv.dart';
import 'package:navika/widgets/exercises/declension/instrumental/instrumental.dart';
import 'package:navika/widgets/exercises/declension/lokativ/lokativ.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/exercises/declension/vokativ/vokativ.dart';
import 'package:navika/widgets/main-menu/exercise-button.dart';

class DeclensionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = [
      ExerciseButton(
        halfWidth: true,
        destination: AllCases(),
        icon: Icons.group,
        label: AppLocalizations.of(context)!.allCases,
        imagePath: 'assets/banners/montenegro_sm.jpg',
      ),
      ExerciseButton(
        halfWidth: true,
        destination: Nominativ(),
        icon: Icons.category_outlined,
        label: N.getCaseLabel(Cases.Nom),
        imagePath: 'assets/banners/seaside_sm.jpg',
      ),
      ExerciseButton(
          halfWidth: true,
          destination: Akuzativ(),
          icon: Icons.remove_red_eye_outlined,
          label: 'Akuzativ',
          imagePath: 'assets/banners/pay_sm.jpg'),
      ExerciseButton(
          halfWidth: true,
          destination: Instrumental(),
          icon: Icons.handyman_outlined,
          label: 'Instrumental',
          imagePath: 'assets/banners/vespa_sm.jpg'),
      ExerciseButton(
          halfWidth: true,
          destination: Lokativ(),
          icon: Icons.location_on_outlined,
          label: 'Lokativ',
          imagePath: 'assets/banners/ladies_sm.jpg'),
      ExerciseButton(
          halfWidth: true,
          destination: Dativ(),
          icon: Icons.arrow_forward,
          label: 'Dativ',
          imagePath: 'assets/banners/giving_sm.jpg'),
      ExerciseButton(
          halfWidth: true,
          destination: Genitiv(),
          icon: Icons.coffee,
          label: 'Genitiv',
          imagePath: 'assets/banners/bosna_sm.jpg'),
      ExerciseButton(
          halfWidth: true,
          destination: Vokativ(),
          icon: Icons.call_rounded,
          label: 'Vokativ',
          imagePath: 'assets/banners/woman_sm.jpg'),
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
              child: GridView.count(crossAxisCount: 2, children: buttons),
            )
          ],
        ),
      ),
    );
  }
}
