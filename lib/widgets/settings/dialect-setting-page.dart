import 'package:flutter/material.dart';
import 'package:navika/main.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/nav-spinner.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_round_button.dart';
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
        title: N.t(context).appTitle,
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
                          N.t(context).dialectTitle,
                          style: TextStyle(fontSize: FONT_SIZE * 2.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: FONT_SIZE, bottom: FONT_SIZE),
                          child: Text(N.t(context).dialectDesc,
                              style: TextStyle(
                                  fontSize: FONT_SIZE,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ),
                        NRoundButton(
                            title: N.t(context).serbian,
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
                            title: N.t(context).nonSerbian,
                            onPressed: () {
                              model.setDialectType(DialectType.Ijekavian);
                              model.setBoolSetting(
                                  SettingsKeys.isFirstTime, false);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NHomePage()),
                              );
                            }),
                        NTextLink(
                            title: N.t(context).skip,
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
