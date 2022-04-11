import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/main.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/nav-spinner.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n-round-button.dart';
import 'package:provider/provider.dart';

class FirstTimePage extends StatelessWidget {
  const FirstTimePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        title: AppLocalizations.of(context)!.appTitle,
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
                  // TODO: Add text to lang files
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(FONT_SIZE),
                      child: Column(children: [
                        Text(
                          'It looks like it\'s your first time using Navika!',
                          style: TextStyle(fontSize: FONT_SIZE * 2.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: FONT_SIZE, bottom: FONT_SIZE),
                          child: Text(
                              'We just have a couple questions for you. First, do you know if you want to practice Croatian/Bosnian dialects, or the Serbian dialect? It\'s ok if you don\'t know and you can set this later in the settings page',
                              style: TextStyle(
                                  fontSize: FONT_SIZE,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ),
                        NRoundButton(
                            title: AppLocalizations.of(context)!.serbian,
                            onPressed: () {
                              model.setDialectType(DialectType.Ekavian);
                              model.setBoolSetting(
                                  SettingsKeys.isFirstTime, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NHomePage()),
                              );
                            }),
                        NRoundButton(
                            title: AppLocalizations.of(context)!.nonSerbian,
                            onPressed: () {
                              model.setDialectType(DialectType.Ijekavian);
                              model.setBoolSetting(
                                  SettingsKeys.isFirstTime, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NHomePage()),
                              );
                            })
                      ]),
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
