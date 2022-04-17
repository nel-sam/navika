import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-exercise.dart';

class PastTense extends StatelessWidget {
  final DialectType dialect;

  const PastTense({
    Key? key,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = N.t(context).pastTense;

    return VerbExercise(
      title: title,
      dialect: dialect,
      tense: VerbTenses.PastPerfect,
      imagePath: 'assets/banners/bosna.jpg',
      description: N.t(context).pastTenseDesc,
      youtubeLink: RECOMMENDED_VIDEO_PAST_SIMPLE,
    );
  }
}
