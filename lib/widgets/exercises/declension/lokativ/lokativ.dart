import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/declension/exercise_type_menus/declension_type_menu.dart';

class Lokativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Lokativ';

    return DeclensionTypeMenu(
      title: title,
      caseType: Cases.Lok,
      description: N.t('lokativDescription'),
      youtubeLink: RECOMMENDED_VIDEO_LOK,
    );
  }
}
