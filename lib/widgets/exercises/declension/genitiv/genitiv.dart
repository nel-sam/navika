import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/declension/exercise_type_menus/declension_type_menu.dart';

class Genitiv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Genitiv';

    return DeclensionTypeMenu(
      title: title,
      caseType: Cases.Gen,
      description: N.t('genitiveDescription'),
    );
  }
}
