import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exercise.dart';
import 'package:navika/widgets/main-menu/declension-menu.dart';
import 'package:navika/widgets/main-menu/grammar-menu.dart';
import 'package:navika/widgets/main-menu/verb-menu.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button-text-icon.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-menu.dart';

class MenuFooter extends StatelessWidget {
  final int activeIndex;

  const MenuFooter({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NFooterMenu(
      buttons: [
        //HomeButtonWrapper(isActive: activeIndex == 0),
        NFooterButton(
          active: activeIndex == 1,
          text: AppLocalizations.of(context)!.grammar,
          icon: NavIcons.grammarGuides,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GrammarMenu(),
              ),
            );
          },
        ),
        NFooterButton(
          active: activeIndex == 2,
          text: AppLocalizations.of(context)!.cases,
          icon: NavIcons.cases,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeclensionMenu(),
              ),
            );
          },
        ),
        NFooterButton(
          active: activeIndex == 3,
          text: AppLocalizations.of(context)!.verbs,
          icon: NavIcons.verbs,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerbMenu(),
              ),
            );
          },
        ),
        NFooterButtonTextIcon(
          active: activeIndex == 4,
          text: AppLocalizations.of(context)!.cyrillic,
          iconText: NavIcons.cyrillic,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CyrillicExercise(),
              ),
            );
          },
        ),
      ],
    );
  }
}
