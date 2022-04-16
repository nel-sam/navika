import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-exercise.dart';

class PastTense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = N.t(context).pastTense;

    return VerbExercise(
      title: title,
      tense: VerbTenses.PastPerfect,
      imagePath: 'assets/banners/bosna.jpg',
      description: N.t(context).pastTenseDesc,
      youtubeLink: RECOMMENDED_VIDEO_PAST_SIMPLE,
    );
  }
}
