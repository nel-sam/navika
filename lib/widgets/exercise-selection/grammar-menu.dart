import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercise-selection/exercise-button.dart';
import 'package:navika/widgets/grammar/grammar-guide/grammar-guide.dart';
import 'package:navika/widgets/grammar/grammar-guide/tables.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GrammarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttons = <Widget>[
      ExerciseButton(
        destination: GrammarGuide(),
        icon: Icons.menu_book,
        label: AppLocalizations.of(context)!.grammarGuide,
        imagePath: 'assets/banners/books.jpg',
      ),
      ExerciseButton(
        destination: Tables(),
        icon: Icons.menu_book,
        label: AppLocalizations.of(context)!.justTables,
        imagePath: 'assets/banners/tables.jpg',
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
      appBar: N.NavikaAppBar(
          Text(
            AppLocalizations.of(context)!.grammarGuide,
            style: TextStyle(
                fontSize: 30, fontFamily: 'helvetica', color: ACCENT_COLOR),
          ),
          context,
          []),
      body: Center(
        child: Column(
          children: [
            getMain(),
          ],
        ),
      ),
    );
  }
}
