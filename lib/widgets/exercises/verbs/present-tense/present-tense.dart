import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb-exercise.dart';

class PresentTense extends StatelessWidget {
  final DialectType dialect;

  const PresentTense({
    Key? key,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = N.t('presentTense');

    return VerbExercise(
      title: title,
      exerciseType: ExerciseTypes.verb_Present,
      tense: VerbTenses.Present,
      dialect: dialect,
      imagePath: 'assets/banners/hills.jpg',
      description: N.t('presentTenseDesc'),
      youtubeLink: RECOMMENDED_VIDEO_PRESENT_SIMPLE,
    );
  }
}
