import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/verbs/shared/verb_exercise.dart';

class PastTense extends StatelessWidget {
  final DialectType dialect;
  final bool isPremium;

  const PastTense({
    Key? key,
    required this.dialect,
    required this.isPremium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = N.t('pastTense');

    return VerbExercise(
      isPremium: isPremium,
      title: title,
      exerciseType: ExerciseTypes.verb_Simple_Past,
      dialect: dialect,
      tense: VerbTenses.PastPerfect,
      imagePath: 'assets/banners/bosna.jpg',
      description: N.t('pastTenseDesc'),
      youtubeLink: RECOMMENDED_VIDEO_PAST_SIMPLE,
    );
  }
}
