import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/declension/exercise_type_menus/declension_type_menu.dart';

class Instrumental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Instrumental';

    return DeclensionTypeMenu(
      title: title,
      caseType: Cases.Ins,
      description: N.t('instrumentalDescription'),
      youtubeLink: RECOMMENDED_VIDEO_INST,
    );
  }
}
