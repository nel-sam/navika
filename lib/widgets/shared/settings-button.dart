import 'package:flutter/material.dart';
import 'package:navika/widgets/shared/settings-page.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NFooterButton(
        // import 'package:flutter_gen/gen_l10n/app_localizations.dart';
        //text: AppLocalizations.of(context)!.settings,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        },
        icon: Icons.settings);
  }
}
