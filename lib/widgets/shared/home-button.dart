import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/footer-button.dart';

// ignore: non_constant_identifier_names
Widget HomeButton(BuildContext context) => FooterButton(
      context: context,
      icon: Icons.home,
      text: AppLocalizations.of(context)!.home,
      onPressed: () => Navigator.popUntil(
        context,
        ModalRoute.withName('/'),
      ),
    );
