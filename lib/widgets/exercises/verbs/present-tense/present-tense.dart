import 'package:navika/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-exercise.dart';
import 'package:navika/widgets/shared/info-banner.dart';

class PresentTense extends StatelessWidget {
  const PresentTense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.presentTense;

    return VerbExercise(
      title: title,
      tense: VerbTenses.Present,
      banner: InfoBanner(
        imagePath: 'assets/banners/hills.jpg',
        label: title,
        description: AppLocalizations.of(context)!.presentTenseDesc,
        youtubeLink: RECOMMENDED_VIDEO_PRESENT_SIMPLE,
        callBack: (bool) {},
      ),
    );
  }
}
