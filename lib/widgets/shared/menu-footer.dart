import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-exercise.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension-guide.dart';
import 'package:navika/widgets/menus/declension-menu.dart';
import 'package:navika/widgets/menus/verb-menu.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button_text_icon.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';

class MenuFooter extends StatelessWidget {
  final int activeIndex;

  const MenuFooter({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsConsumerWrapper(
      getChildWidget: (Settings settings) => NFooterMenu(
        buttons: [
          //HomeButtonWrapper(isActive: activeIndex == 0),
          NFooterButton(
            active: activeIndex == 1,
            text: N.t(context).grammar,
            icon: NavIcons.grammarGuides,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => GrammarMenu(),
                  builder: (context) =>
                      DeclensionGuide(dialect: settings.dialectType),
                ),
              );
            },
          ),
          NFooterButton(
            active: activeIndex == 2,
            text: N.t(context).cases,
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
            text: N.t(context).verbs,
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
            text: N.t(context).cyrillic,
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
      ),
    );
  }
}
