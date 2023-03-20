import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/declension/exercise-type-menus/declension-type-menu.dart';

class Akuzativ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Akuzativ';

    return DeclensionTypeMenu(
      title: title,
      caseType: Cases.Aku,
      description: N.t('akuzativDescription'),
      youtubeLink: RECOMMENDED_VIDEO_AKU,
    );
  }
}
