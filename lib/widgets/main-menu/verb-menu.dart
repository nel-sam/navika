import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/exercises/verbs/past-tense/past-tense.dart';
import 'package:navika/widgets/exercises/verbs/present-tense/present-tense.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-button.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-header.dart';

class VerbMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      NMenuButton(
        destination: PresentTense(),
        label: AppLocalizations.of(context)!.presentTense,
        transLabel: 'Sadašnje vrijeme',
      ),
      NMenuButton(
        destination: PastTense(),
        label: AppLocalizations.of(context)!.pastTense,
        transLabel: 'Prošlo vrijeme',
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(
        context: context,
      ),
      body: Center(
        child: Column(
          children: [
            const AdCard(),
            NMenuHeader(
              icon: Icons.nordic_walking,
              transLabel: AppLocalizations.of(context)!.verbs,
              label: SbcLabels.verbs,
            ),
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
