import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/navika-theme.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(
        title: AppLocalizations.of(context)!.settings,
        context: context,
      ),
      body: ChangeNotifierProvider<SettingsNotifier>(
        create: (context) => SettingsNotifier(),
        child: Center(
            child: Consumer<SettingsNotifier>(
          builder: (context, model, child) => Padding(
            padding: const EdgeInsets.all(FONT_SIZE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SettingsSwitch(
                  title: AppLocalizations.of(context)!.autoNextQuestion,
                  value: model.settings.autoNextQuestion,
                  onChanged: (newVal) => {model.setAutoNextQuestion(newVal)},
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class SettingsSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final Function onChanged;

  const SettingsSwitch(
      {Key? key,
      required this.title,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Text(title)),
        Switch(
          activeColor: navPalette,
          value: value,
          onChanged: (newVal) => {onChanged(newVal)},
        )
      ],
    );
  }
}
