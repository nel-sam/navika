import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/shared/case-exercise.dart';

class AllCases extends StatelessWidget {
  const AllCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = N.t(context).allCases;

    return
        // TODO: Remove CaseExercise and bring back DeclensionTypeMenu
        CaseExercise(
            title: title,
            caseType: Cases.Nom,
            imagePath: 'assets/banners/seaside_city.jpg',
            youtubeLink: RECOMMENDED_VIDEO_NOM,
            description: N.t(context).nominativDescription);
    // DeclensionTypeMenu(
    //   title: title,
    //   caseType: Cases.All,
    //   imagePath: 'assets/banners/montenegro.jpg',
    //   description: N.t(context).allCasesDesc,
    // );
  }
}
