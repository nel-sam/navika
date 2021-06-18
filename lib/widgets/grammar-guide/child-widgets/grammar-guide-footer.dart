import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/shared/home-button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: non_constant_identifier_names
List<Widget> GrammarGuideFooterButtons(BuildContext context) => [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.arrow_upward, color: ICON_COLOR),
              label: Text(AppLocalizations.of(context)!.previous),
            ),
          ),
          HomeButton(context),
          Padding(
            padding: const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.arrow_downward, color: ICON_COLOR),
              label: Text(AppLocalizations.of(context)!.next),
            ),
          ),
        ],
      ),
    ];
