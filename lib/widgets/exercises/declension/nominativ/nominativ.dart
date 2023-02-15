import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/exercise-type-menus/nom-declension-type-menu.dart';

class Nominativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = N.getCaseLabel(Cases.Nom);

    return NomDeclensionTypeMenu(
      title: title,
      caseType: Cases.Nom,
      description: N.t('nominativDescription'),
    );
  }
}
