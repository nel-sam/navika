import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';

class Nominativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = N.getCaseLabel(Cases.Nom);

    return CaseExercise(
      title: title,
      caseType: Cases.Nom,
      imagePath: 'assets/banners/seaside_city.jpg',
      youtubeLink: RECOMMENDED_VIDEO_NOM,
      description: N.t('nominativDescription'),
    );
  }
}
