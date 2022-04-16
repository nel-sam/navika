import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class InfoBanner extends StatefulWidget {
  final String label;
  final String description;
  final String? youtubeLink;

  const InfoBanner({
    Key? key,
    required this.label,
    required this.description,
    this.youtubeLink,
  }) : super(key: key);

  @override
  State<InfoBanner> createState() => _InfoBannerState();
}

class StateObj {
  bool isExpanded = false;
  bool hasYouTubeLink = false;
}

class _InfoBannerState extends State<InfoBanner> {
  final state = StateObj();

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 400),
      dividerColor: Colors.red,
      elevation: 1,
      expansionCallback: (int item, bool status) {
        setState(() {
          state.isExpanded = !state.isExpanded;
        });
      },
      children: [
        ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(
                        color: Nrs.getPrimaryColor(context),
                        fontSize: 18,
                      ),
                    ),
                    NTextSpan(
                      AppLocalizations.of(context)!.expand_for_more,
                      textStyle:
                          Nrs.getTextStyle(context: context, fontSize: 12),
                    )
                  ],
                ),
              );
            },
            isExpanded: state.isExpanded,
            body: Container(
              height: 420,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      widget.description,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    if (state.hasYouTubeLink)
                      YouTubeLink(this.widget.youtubeLink!)
                  ],
                ),
              ),
            ))
      ],
    );
  }

  @override
  void initState() {
    state.isExpanded = false;
    state.hasYouTubeLink =
        this.widget.youtubeLink != null && this.widget.youtubeLink!.length > 0;
    super.initState();
  }
}
