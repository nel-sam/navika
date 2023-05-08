import 'package:flutter/material.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubeLink extends StatelessWidget {
  final String url;

  const YouTubeLink(
    this.url, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radius = 100;
    const IconData playIcon = Icons.smart_display_rounded;
    final uri = Uri.parse(this.url);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: () async {
          await canLaunchUrl(uri)
              ? await launchUrl(uri)
              : throw 'Could not launch $url';
        },
        child: Padding(
          padding: const EdgeInsets.all(FONT_SIZE - 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: FONT_SIZE / 2),
                child: Icon(playIcon),
              ),
              Text(N.t('recommendedVideo').toUpperCase()),
            ],
          ),
        ),
      ),
    );
  }
}
