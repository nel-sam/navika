import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';

class Vokativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = N.getCaseLabel(Cases.Vok);

    return CaseExercise(
      title: title,
      caseType: Cases.Vok,
      imagePath: 'assets/banners/woman.jpg',
      description: N.t(context).vokativDescription,
      //youtubeLink: RECOMMENDED_VIDEO_VOK,
    );
  }
}
