import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/declension/exercise_type_menus/declension_type_menu.dart';

class Vokativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = N.getCaseLabel(Cases.Vok);

    return DeclensionTypeMenu(
      title: title,
      caseType: Cases.Vok,
      description: N.t('vokativDescription'),
      //youtubeLink: RECOMMENDED_VIDEO_VOK,
    );
  }
}
