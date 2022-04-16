import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-exercise.dart';

class PresentTense extends StatelessWidget {
  const PresentTense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = N.t(context).presentTense;

    return VerbExercise(
      title: title,
      tense: VerbTenses.Present,
      imagePath: 'assets/banners/hills.jpg',
      description: N.t(context).presentTenseDesc,
      youtubeLink: RECOMMENDED_VIDEO_PRESENT_SIMPLE,
    );
  }
}
