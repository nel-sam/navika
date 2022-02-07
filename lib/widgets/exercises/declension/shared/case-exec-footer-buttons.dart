import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension-guide.dart';
import 'package:navika/widgets/shared/footer-button.dart';
import 'package:navika/widgets/shared/home-button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: non_constant_identifier_names
List<Widget> CaseExecFooterButtons({
  required Cases caseType,
  required void Function() refreshFunction,
  required BuildContext context,
}) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
          child: FooterButton(
            onPressed: refreshFunction,
            icon: Icons.refresh_outlined,
            text: AppLocalizations.of(context)!.refresh,
            context: context,
          ),
        ),
        HomeButton(context),
        Padding(
          padding: const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
          child: FooterButton(
            onPressed: () {
              final dest = DeclensionGuide(startingCase: caseType);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dest),
              );
            },
            icon: Icons.help_center_outlined,
            text: AppLocalizations.of(context)!.grammar,
            context: context,
          ),
        ),
      ],
    ),
  ];
}
