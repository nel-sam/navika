import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class InfoBanner extends StatefulWidget {
  final String imagePath;
  final String label;
  final String description;
  final String? youtubeLink;

  const InfoBanner({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.description,
    this.youtubeLink,
  }) : super(key: key);

  @override
  State<InfoBanner> createState() => _InfoBannerState();
}

class _InfoBannerState extends State<InfoBanner> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    bool hasYouTubeLink =
        this.widget.youtubeLink != null && this.widget.youtubeLink!.length > 0;
    double height = 420;

    var content = Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              widget.description,
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            if (hasYouTubeLink) YouTubeLink(context, this.widget.youtubeLink!)
          ],
        ),
      ),
    );

    return ExpansionPanelList(
      animationDuration: Duration(milliseconds: 400),
      dividerColor: Colors.red,
      elevation: 1,
      expansionCallback: (int item, bool status) {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(
                        color: ACCENT_COLOR,
                        fontSize: 18,
                      ),
                    ),
                    NText(
                      AppLocalizations.of(context)!.expand_for_more,
                      fontSize: 12,
                    )
                  ],
                ),
              );
            },
            isExpanded: isExpanded,
            body: content)
      ],
    );
  }
}
