import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/grammar-guide.dart';
import 'package:navika/widgets/shared/home-button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: non_constant_identifier_names
List<Widget> NavikaChildFooterButtons({
  required CaseTypeEnum caseType,
  required void Function() refreshFunction,
  required BuildContext context,
}) {
  final Color iconColor = N.isDarkTheme(context) ? Colors.white : ICON_COLOR;

  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
          child: TextButton.icon(
            onPressed: refreshFunction,
            icon: Icon(
              Icons.refresh_outlined,
              color: iconColor,
            ),
            label: Text(AppLocalizations.of(context)!.refresh),
          ),
        ),
        HomeButton(context),
        Padding(
          padding: const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GrammarGuide(scrollToCase: caseType)),
              );
            },
            icon: Icon(
              Icons.help_center_outlined,
              color: iconColor,
            ),
            label: Text(AppLocalizations.of(context)!.grammarGuide),
          ),
        ),
      ],
    ),
  ];
}
