import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TranslationLink extends StatelessWidget {
  final String sentence;

  const TranslationLink({
    Key? key,
    required this.sentence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final encoded = Uri.encodeComponent(sentence);
    String url =
        'https://translate.google.com/?sl=hr&tl=$lang&text=$encoded&op=translate';

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: OutlinedButton(
        onPressed: () async {
          await canLaunch(url)
              ? await launch(url)
              : throw 'Could not launch $url';
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.translate),
            ),
            Text(AppLocalizations.of(context)!.translate),
          ],
        ),
      ),
    );
  }
}
