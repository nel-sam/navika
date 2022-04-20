import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';

class Akuzativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Akuzativ';

    return CaseExercise(
      title: title,
      caseType: Cases.Aku,
      imagePath: 'assets/banners/pay.jpg',
      description: N.t('akuzativDescription'),
      youtubeLink: RECOMMENDED_VIDEO_AKU,
    );
  }
}
