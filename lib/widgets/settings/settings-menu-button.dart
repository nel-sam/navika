import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-action-arrow.dart';

class SettingsMenuButton extends StatelessWidget {
  final Widget Function(BuildContext) redirectMethod;

  SettingsMenuButton({
    Key? key,
    required this.redirectMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        primary: Nrs.getPrimaryColor(context),
        backgroundColor: Nrs.getAppBarColor(),
        side: BorderSide(color: BORDER_COLOR.withOpacity(0.15), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: FONT_SIZE, bottom: FONT_SIZE),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: FONT_SIZE / 2),
                  child: Icon(Icons.account_circle),
                ),
                Text(AppLocalizations.of(context)!.account)
              ],
            ),
            NActionArrow()
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: redirectMethod),
        );
      },
    );
  }
}
