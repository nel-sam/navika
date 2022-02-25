import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension-guide.dart';
import 'package:navika/widgets/grammar/grammar-guide/tables.dart';
import 'package:navika/widgets/main-menu/exercise-button.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class GrammarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        destination: DeclensionGuide(),
        icon: Icons.menu_book,
        label: AppLocalizations.of(context)!.cases,
        sbcLabel: 'Padež',
        imagePath: 'assets/banners/books_lg.jpg',
      ),
      ExerciseButton(
        destination: Tables(),
        icon: Icons.apps_rounded,
        label: AppLocalizations.of(context)!.justCaseTables,
        sbcLabel: 'Samo tablice',
        imagePath: 'assets/banners/tables_lg.jpg',
      ),
    ];

    Widget getMain() {
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: buttons,
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(
        title: SbcLabels.grammarGuide,
        transTitle: AppLocalizations.of(context)!.grammarGuides,
        context: context,
      ),
      body: Center(
        child: Column(
          children: [
            getMain(),
            const AdCard(),
          ],
        ),
      ),
    );
  }
}
