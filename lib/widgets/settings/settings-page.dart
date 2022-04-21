import 'package:flutter/material.dart';
import 'package:navika/main.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/navika-theme.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/settings/account-page.dart';
import 'package:navika/widgets/settings/settings-menu-button.dart';
import 'package:navika/widgets/shared/nav-spinner.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
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
        showSettingsButton: false,
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
                      SettingsSwitch(
                        title: N.t('useSerbian'),
                        description: N.t('useSerbianDesc'),
                        value: settings.dialectType == DialectType.Ekavian,
                        onChanged: (bool isSelected) {
                          if (isSelected)
                            model.setDialectType(DialectType.Ekavian);
                          else
                            model.setDialectType(DialectType.Ijekavian);
                        },
                      ),
                      Padding(padding: const EdgeInsets.only(top: FONT_SIZE)),
                      SettingsMenuButton(
                          title: N.t('resetSettings'),
                          icon: Icons.refresh_outlined,
                          redirectMethod: (context) {
                            model.resetSettings();
                            return NHomePage();
                          }),
                      SettingsMenuButton(
                          title: N.t('account'),
                          icon: Icons.account_circle,
                          redirectMethod: (context) => AccountPage()),
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
            SizedBox(
                width: Nrs.getScreenWidth() * 0.7,
                child: Text(
                  description,
                  style: TextStyle(color: Colors.grey),
                )),
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
