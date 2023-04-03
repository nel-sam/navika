import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/exercise-nav-notifier.dart';
import 'package:navika/state/settings/settings-consumer-wrapper.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guides/number-guide/number-guide.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:navika/widgets/shared/home-button-wrapper.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:provider/provider.dart';

class CountingExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsConsumerWrapper(
      getChildWidget: (settings) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: Nrs.NrsAppBar(title: N.t('numbers'), context: context),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdCard(),
                ChangeNotifierProvider<ExerciseNavNotifier>(
                  create: (context) => ExerciseNavNotifier(
                      dialect: settings.dialectType,
                      exerciseType: ExerciseTypes.numbers_counting,
                      isPremium: settings.isPremium),
                  child: Consumer<ExerciseNavNotifier>(
                    builder: (context, navNotifier, child) {
                      var activeItem = navNotifier.getActive();

                      return Padding(
                          padding: const EdgeInsets.all(24),
                          child: Container());
                    },
                  ),
                ),
              ],
            ),
          ),
          persistentFooterButtons: [
            NFooterMenu(buttons: [
              HomeButtonWrapper(),
              NFooterButton(
                text: N.t('numberGuide'),
                icon: Icons.list,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NumberGuide(dialect: settings.dialectType)),
                  );
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}
