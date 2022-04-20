import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';

class Instrumental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Instrumental';

    return CaseExercise(
      title: title,
      caseType: Cases.Ins,
      imagePath: 'assets/banners/vespa.jpg',
      description: N.t('instrumentalDescription'),
      youtubeLink: RECOMMENDED_VIDEO_INST,
    );
  }
}
