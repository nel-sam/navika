import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/main.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/navika_theme.dart';
import 'package:navika/state/settings/settings_notifier.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/settings/account_page.dart';
import 'package:navika/widgets/settings/settings_menu_button.dart';
import 'package:navika/widgets/shared/nav_spinner.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        title: N.t('settings'),
        context: context,
      ),
      body: ChangeNotifierProvider<SettingsNotifier>(
        create: (context) => SettingsNotifier(),
        child: Center(child: Consumer<SettingsNotifier>(
          builder: (context, model, child) {
            return FutureBuilder(
              future: model.getAllSettings(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Settings settings = snapshot.data as Settings;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: FONT_SIZE, right: FONT_SIZE / 2),
                                child: Icon(Icons.language),
                              ),
                              Text(N.t('countryDialect')),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: FONT_SIZE),
                            child: DropdownButton<String>(
                              value: settings.dialectType.name.split('.').last,
                              style: const TextStyle(color: navPalette),
                              underline: Container(
                                height: 2,
                                color: navPalette,
                              ),
                              onChanged: (String? newValue) {
                                model.setDialectType(
                                    N.dialectTypeStrToEnum(newValue!));
                              },
                              items: DialectType.values
                                  .map<DropdownMenuItem<String>>(
                                      (DialectType value) {
                                return DropdownMenuItem<String>(
                                  value: value.name.split('.').last,
                                  child: Text(N.t(value.name)),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.only(top: FONT_SIZE)),
                      SettingsMenuButton(
                          title: N.t('resetSettings'),
                          icon: Icons.refresh_outlined,
                          redirectMethod: (context) {
                            model.resetSettings();
                            return NHomePage();
                          }),
                      FLAG_PREMIUM_FEATURE
                          ? SettingsMenuButton(
                              title: N.t('account'),
                              icon: Icons.account_circle,
                              redirectMethod: (context) => AccountPage())
                          : Container(),
                    ],
                  );
                } else {
                  return NavSpinner();
                }
              },
            );
          },
        )),
      ),
    );
  }
}

class SettingsSwitch extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final Function onChanged;

  const SettingsSwitch(
      {Key? key,
      required this.title,
      required this.value,
      required this.onChanged,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(FONT_SIZE),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: FONT_SIZE * 0.5),
              child: Text(
                title,
                style: TextStyle(fontSize: FONT_SIZE * 1.4),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TODO: Verify this
            Text(
              description,
              style: TextStyle(color: Colors.grey),
            ),
            Switch(
              activeColor: navPalette,
              value: value,
              onChanged: (newVal) => {onChanged(newVal)},
            )
          ],
        ),
      ]),
    );
  }
}
