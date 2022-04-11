import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/settings/settings-page.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        title: AppLocalizations.of(context)!.account,
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
                        title: AppLocalizations.of(context)!.isPremium,
                        description:
                            AppLocalizations.of(context)!.isPremiumDesc,
                        value: settings.isPremium,
                        onChanged: (newVal) => {
                          model.setBoolSetting(SettingsKeys.isPremium, newVal)
                        },
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            );
          },
        )),
      ),
    );
  }
}
