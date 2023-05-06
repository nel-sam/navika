import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings_consumer_wrapper.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic_exercise.dart';
import 'package:navika/widgets/grammar-guides/declension-guide/declension_guide.dart';
import 'package:navika/widgets/menus/declension_menu.dart';
import 'package:navika/widgets/menus/verb_menu.dart';
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
      getChildWidget: (Settings settings) {
        return NFooterMenu(
          buttons: [
            NFooterButton(
              active: activeIndex == 1,
              text: N.t('grammar'),
              icon: NavIcons.grammarGuides,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DeclensionGuide(dialect: settings.dialectType),
                  ),
                );
              },
            ),
            NFooterButton(
              active: activeIndex == 2,
              text: N.t('cases'),
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
              text: N.t('verbs'),
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
              text: N.t('cyrillic'),
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
      },
    );
  }
}
