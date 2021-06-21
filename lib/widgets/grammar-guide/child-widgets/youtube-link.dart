import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: non_constant_identifier_names
Widget YouTubeLink(BuildContext context, String url) {
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
            child: Icon(Icons.ondemand_video),
          ),
          Text(AppLocalizations.of(context)!.recommendedVideo),
        ],
      ),
    ),
  );
}
