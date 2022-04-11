import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/exercises/declension/exercise-type-menus/declension-type-menu.dart';

class AllCases extends StatelessWidget {
  const AllCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.allCases;

    return DeclensionTypeMenu(
      title: title,
      caseType: Cases.All,
      imagePath: 'assets/banners/montenegro.jpg',
      description: AppLocalizations.of(context)!.allCasesDesc,
    );
  }
}
