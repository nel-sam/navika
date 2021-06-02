import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/explanation-popup-base.dart';

class AdjectiveExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExplanationPopupBase(
      title: AppLocalizations.of(context)!.adjectives,
      content: Text("TEST"),
    );
  }
}
