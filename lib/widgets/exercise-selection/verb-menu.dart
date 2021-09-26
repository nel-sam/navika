import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/exercise-selection/exercise-button.dart';
import 'package:navika/widgets/exercises/verbs/past-tense.dart';

class VerbMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        destination: PastTense(),
        icon: Icons.keyboard_return,
        label: AppLocalizations.of(context)!.pastTense,
        imagePath: 'assets/banners/bosna.jpg',
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.NavikaAppBar(
          Text(
            AppLocalizations.of(context)!.verbs,
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
