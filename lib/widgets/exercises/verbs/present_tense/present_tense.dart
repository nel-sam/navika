import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb_exercise.dart';

class PresentTense extends StatelessWidget {
  final DialectType dialect;
  final bool isPremium;

  const PresentTense({
    Key? key,
    required this.dialect,
    required this.isPremium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = N.t('presentTense');

    return VerbExercise(
      isPremium: isPremium,
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
