import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/exercise-type-menus/declension-type-menu.dart';

class Nominativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = N.getCaseLabel(Cases.Nom);

    return DeclensionTypeMenu(
      title: title,
      caseType: Cases.Nom,
      description: N.t('nominativDescription'),
    );
  }
}
