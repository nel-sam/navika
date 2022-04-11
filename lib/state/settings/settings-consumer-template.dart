import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/nav-spinner.dart';
import 'package:provider/provider.dart';

class SettingsConsumerTemplate extends StatelessWidget {
  final Future<Settings> future;
  final Widget childWidget;

  const SettingsConsumerTemplate({
    Key? key,
    required this.future,
    required this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: N.navAppBar(
        title: AppLocalizations.of(context)!.account,
        context: context,
      ),
      body: ChangeNotifierProvider<SettingsNotifier>(
        create: (context) => SettingsNotifier(),
        child: Center(child: Consumer<SettingsNotifier>(
          builder: (context, model, child) {
            return FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Settings settings = snapshot.data as Settings;

                  return childWidget;
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
