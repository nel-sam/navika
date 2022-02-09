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
  final allCases = AllCases();
  final nom = Nominativ();
  final aku = Akuzativ();
  final inst = Instrumental();
  final lok = Lokativ();
  final dat = Dativ();
  final gen = Genitiv();
  final vok = Vokativ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.NavikaAppBar(
        title: SbcLabels.cases,
        transTitle: AppLocalizations.of(context)!.cases,
        context: context,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(crossAxisCount: 2, children: [
                ExerciseButton(
                  halfWidth: true,
                  destination: allCases,
                  icon: Icons.group,
                  label: AppLocalizations.of(context)!.allCases,
                  sbcLabel: 'Sve padeže',
                  imagePath: 'assets/banners/montenegro_sm.jpg',
                ),
                ExerciseButton(
                  halfWidth: true,
                  destination: nom,
                  icon: Icons.category_outlined,
                  label: N.getCaseLabel(Cases.Nom),
                  imagePath: 'assets/banners/seaside_sm.jpg',
                ),
                ExerciseButton(
                    halfWidth: true,
                    destination: aku,
                    icon: Icons.remove_red_eye_outlined,
                    label: AppLocalizations.of(context)!.akuzativ,
                    sbcLabel: 'Akuzativ',
                    imagePath: 'assets/banners/pay_sm.jpg'),
                ExerciseButton(
                    halfWidth: true,
                    destination: inst,
                    icon: Icons.handyman_outlined,
                    label: AppLocalizations.of(context)!.instrumental,
                    sbcLabel: 'Instrumental',
                    imagePath: 'assets/banners/vespa_sm.jpg'),
                ExerciseButton(
                    halfWidth: true,
                    destination: lok,
                    icon: Icons.location_on_outlined,
                    label: AppLocalizations.of(context)!.lokativ,
                    sbcLabel: 'Lokativ',
                    imagePath: 'assets/banners/ladies_sm.jpg'),
                ExerciseButton(
                    halfWidth: true,
                    destination: dat,
                    icon: Icons.arrow_forward,
                    label: AppLocalizations.of(context)!.dativ,
                    sbcLabel: 'Dativ',
                    imagePath: 'assets/banners/giving_sm.jpg'),
                ExerciseButton(
                    halfWidth: true,
                    destination: gen,
                    icon: Icons.coffee,
                    label: AppLocalizations.of(context)!.genitiv,
                    sbcLabel: 'Genitiv',
                    imagePath: 'assets/banners/bosna_sm.jpg'),
                ExerciseButton(
                    halfWidth: true,
                    destination: vok,
                    icon: Icons.call_rounded,
                    label: AppLocalizations.of(context)!.vokativ,
                    sbcLabel: 'Vokativ',
                    imagePath: 'assets/banners/woman_sm.jpg'),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
