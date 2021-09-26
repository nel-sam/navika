import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

class PastTense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'TODO DIS';

    return CaseExercise(
      title: title,
      caseType: Cases.Aku,
      banner: NavikaBanner(
        imagePath: 'assets/banners/bosna.jpg',
        caseName: title,
        description: '',
        icons: [Icons.keyboard_return],
      ),
    );
  }
}
