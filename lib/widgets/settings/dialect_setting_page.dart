import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings_notifier.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/menus/main_menu.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_keyboard_message.dart';
import 'package:nrs_flutter_lib/widgets/n_round_button.dart';
import 'package:nrs_flutter_lib/widgets/n_spinner.dart';
import 'package:nrs_flutter_lib/widgets/n_text_link.dart';
import 'package:provider/provider.dart';

class DialectSettingPage extends StatelessWidget {
  const DialectSettingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        title: N.t('appTitle'),
        context: context,
      ),
      body: ChangeNotifierProvider<SettingsNotifier>(
        create: (context) => SettingsNotifier(),
        child: Center(child: Consumer<SettingsNotifier>(
          builder: (context, settings, child) {
            return FutureBuilder(
              future: settings.getAllSettings(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final settingsSnapshot = snapshot.data as Settings;

                  return SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(FONT_SIZE),
                        child: Column(children: [
                          Text(
                            N.t('dialectTitle'),
                            style: TextStyle(fontSize: FONT_SIZE * 2),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: FONT_SIZE, bottom: FONT_SIZE),
                            child: Text(N.t('dialectDesc'),
                                style: TextStyle(
                                    fontSize: FONT_SIZE,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ),
                          NRoundButton(
                              title: N.t('serbia'),
                              onPressed: () {
                                settings.setDialectType(DialectType.Serbia);
                                settings.setBoolSetting(
                                    SettingsKeys.isFirstTime, false);
                                navigateToNextPage(context, settings,
                                    settingsSnapshot.isFirstTime);
                              }),
                          NRoundButton(
                              title: N.t('croatia'),
                              onPressed: () {
                                settings.setDialectType(DialectType.Croatia);
                                settings.setBoolSetting(
                                    SettingsKeys.isFirstTime, false);
                                navigateToNextPage(context, settings,
                                    settingsSnapshot.isFirstTime);
                              }),
                          NRoundButton(
                              title: N.t('bosnia'),
                              onPressed: () {
                                settings.setDialectType(DialectType.Bosnia);
                                settings.setBoolSetting(
                                    SettingsKeys.isFirstTime, false);
                                navigateToNextPage(context, settings,
                                    settingsSnapshot.isFirstTime);
                              }),
                          NTextLink(
                              title: N.t('skip'),
                              onPressed: () {
                                settings.setDialectType(DialectType.Bosnia);
                                settings.setBoolSetting(
                                    SettingsKeys.isFirstTime, false);
                                navigateToNextPage(context, settings,
                                    settingsSnapshot.isFirstTime);
                              })
                        ]),
                      ),
                    ),
                  );
                } else {
                  return NSpinner();
                }
              },
            );
          },
        )),
      ),
    );
  }

  Future<dynamic> navigateToNextPage(
      BuildContext context, SettingsNotifier settings, bool isFirstTime) async {
    final route = isFirstTime
        ? NKeyboardMessage(
            welcomeText: 'Dobar dan',
            detailsText: N.t('serbocroatian_keyboard_needed'),
            instructionsButtonText: N.t('instructions'),
            continueLinkText: N.t('continue'),
            imageUrl: 'assets/banners/keyboard.png',
            onContinue: () async {
              await settings.setBoolSetting(SettingsKeys.isFirstTime, false);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainMenu()),
              );
            },
          )
        : MainMenu();

    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
