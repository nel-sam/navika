import 'package:flutter/material.dart';
import 'package:navika/main.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/settings/settings_notifier.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/shared/nav_spinner.dart';
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
        title: N.t('appTitle'),
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
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: N.getMaxScreenWidth(),
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
                                  model.setDialectType(DialectType.Serbia);
                                  model.setBoolSetting(
                                      SettingsKeys.isFirstTime, false);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NHomePage()),
                                  );
                                }),
                            NRoundButton(
                                title: N.t('croatia'),
                                onPressed: () {
                                  model.setDialectType(DialectType.Croatia);
                                  model.setBoolSetting(
                                      SettingsKeys.isFirstTime, false);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NHomePage()),
                                  );
                                }),
                            NRoundButton(
                                title: N.t('bosnia'),
                                onPressed: () {
                                  model.setDialectType(DialectType.Bosnia);
                                  model.setBoolSetting(
                                      SettingsKeys.isFirstTime, false);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NHomePage()),
                                  );
                                }),
                            NTextLink(
                                title: N.t('skip'),
                                onPressed: () {
                                  model.setDialectType(DialectType.Bosnia);
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
                      ),
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
