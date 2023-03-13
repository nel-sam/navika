import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/exercise-type-menus/nom-declension-type-menu.dart';

class Nominativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = N.getCaseLabel(Cases.Nom);
    final description = N.t('nominativDescription');

    return NomDeclensionTypeMenu(
      title: title,
      caseType: Cases.Nom,
      description: description,
      youtubeLink: RECOMMENDED_VIDEO_NOM,
    );
  }
}
