import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class PastTense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.pastTense;

    return VerbExercise(
      title: title,
      banner: NavikaBanner(
        imagePath: 'assets/banners/bosna.jpg',
        caseName: title,
        description: AppLocalizations.of(context)!.pastTenseDesc,
        youtubeLink: RECOMMENDED_VIDEO_PAST_SIMPLE,
        icons: [
          Icons.history,
        ],
      ),
    );
  }
}
