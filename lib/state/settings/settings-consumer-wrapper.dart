import 'package:flutter/material.dart';
import 'package:navika/models/settings.dart';
import 'package:navika/state/settings/settings-notifier.dart';
import 'package:navika/widgets/shared/nav-spinner.dart';
import 'package:provider/provider.dart';

class SettingsConsumerWrapper extends StatelessWidget {
  final Widget Function(Settings) getChildWidget;

  const SettingsConsumerWrapper({
    Key? key,
    required this.getChildWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<SettingsNotifier>(
        create: (context) => SettingsNotifier(),
        child: Consumer<SettingsNotifier>(
          builder: (context, model, child) {
            return FutureBuilder(
              future: model.getAllSettings(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return getChildWidget(snapshot.data as Settings);
                } else {
                  return NavSpinner();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
