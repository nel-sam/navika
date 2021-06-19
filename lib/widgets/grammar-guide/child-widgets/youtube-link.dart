// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: non_constant_identifier_names
Widget YouTubeLink(BuildContext context, String url) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () async {
          await canLaunch(url)
              ? await launch(url)
              : throw 'Could not launch $url';
        },
        child: Text(AppLocalizations.of(context)!.recommendedVideo),
      ),
    );
