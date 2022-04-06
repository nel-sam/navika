import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/navika-theme.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/settings/account-page.dart';
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
        title: AppLocalizations.of(context)!.settings,
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

                  return Padding(
                    padding: const EdgeInsets.all(FONT_SIZE),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SettingsSwitch(
                          title: AppLocalizations.of(context)!.autoNextQuestion,
                          description: AppLocalizations.of(context)!
                              .autoNextQuestionDesc,
                          value: settings.autoNextQuestion,
                          onChanged: (newVal) => {
                            model.setBoolSetting(
                                SettingsKeys.autoNextQuestion, newVal)
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: FONT_SIZE, bottom: FONT_SIZE),
                          child: ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              elevation: 6,
                              primary: Nrs.getPrimaryColor(context),
                              backgroundColor: Nrs.getAppBarColor(),
                              shadowColor: BORDER_COLOR.withOpacity(0.25),
                              side: BorderSide(
                                  color: BORDER_COLOR.withOpacity(0.15),
                                  width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: FONT_SIZE, bottom: FONT_SIZE),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: FONT_SIZE / 2),
                                    child: Icon(Icons.account_circle),
                                  ),
                                  Text(AppLocalizations.of(context)!.account)
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountPage()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
    ]);
  }
}
