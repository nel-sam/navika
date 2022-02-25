import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/exercises/verbs/past-tense/past-tense.dart';
import 'package:navika/widgets/exercises/verbs/present-tense/present-tense.dart';
import 'package:navika/widgets/main-menu/exercise-button.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class VerbMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        destination: PresentTense(),
        icon: Icons.checklist_outlined,
        label: AppLocalizations.of(context)!.presentTense,
        sbcLabel: 'Sadašnje vrijeme',
        imagePath: 'assets/banners/hills_lg.jpg',
      ),
      ExerciseButton(
        destination: PastTense(),
        icon: Icons.history,
        label: AppLocalizations.of(context)!.pastTense,
        sbcLabel: 'Prošlo vrijeme',
        imagePath: 'assets/banners/bosna_lg.jpg',
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(
        title: SbcLabels.verbs,
        transTitle: AppLocalizations.of(context)!.verbs,
        context: context,
      ),
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
