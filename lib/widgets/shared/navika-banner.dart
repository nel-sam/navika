import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';

class NavikaBanner extends StatelessWidget {
  final String imagePath;
  final String caseName;
  final String description;
  final List<IconData> icons;
  final String youtubeLink;

  const NavikaBanner({
    Key? key,
    required this.imagePath,
    required this.caseName,
    required this.description,
    required this.icons,
    this.youtubeLink = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasYouTubeLink = this.youtubeLink.length > 0;
    double height = this.description.length.toDouble();

    if (height > 300)
      height = 300;
    else if (height < 145) height = 145;

    if (hasYouTubeLink) height += 40;

    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Column(
          children: [
            Row(children: [
              Text(
                caseName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    children: icons
                        .map((icon) => Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              icon,
                              color: ACCENT_COLOR,
                            )))
                        .toList()),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  if (hasYouTubeLink)
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: YouTubeLink(context, this.youtubeLink),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
