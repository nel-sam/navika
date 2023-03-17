import 'package:flutter/material.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
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
    final buttonWidth =
        Nrs.getScreenWidth() > 500.0 ? 500.0 : Nrs.getScreenWidth() - 40;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: buttonWidth,
        child: ElevatedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Nrs.getPrimaryColor(context),
            elevation: 6,
            backgroundColor: Nrs.getAppBarColor(),
            shadowColor: BORDER_COLOR.withOpacity(0.25),
            side: BorderSide(color: BORDER_COLOR.withOpacity(0.15), width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: () async {
            await canLaunch(url)
                ? await launch(url)
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
      ),
    );
  }
}
