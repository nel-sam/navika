import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExplanationPopupBase extends StatelessWidget {
  final String title;
  final Widget content;

  ExplanationPopupBase({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          content,
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.close),
        ),
      ],
    );
  }
}
