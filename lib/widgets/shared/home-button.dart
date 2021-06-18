import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: non_constant_identifier_names
Widget HomeButton(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
      child: Column(
        children: [
          TextButton.icon(
            icon: Icon(Icons.home, color: ICON_COLOR),
            label: Text(AppLocalizations.of(context)!.home),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
    );
