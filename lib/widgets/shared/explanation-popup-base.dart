import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExplanationPopupBase extends StatelessWidget {
  final String title;
  final Widget content;

  ExplanationPopupBase({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.close),
            ),
          )
        ],
      ),
      body: content,
    );
  }
}
