import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PastTense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.pastTense;

    return VerbExercise(
      title: title,
      tense: VerbTenses.PastPerfect,
      imagePath: 'assets/banners/bosna.jpg',
      description: AppLocalizations.of(context)!.pastTenseDesc,
      youtubeLink: RECOMMENDED_VIDEO_PAST_SIMPLE,
    );
  }
}
