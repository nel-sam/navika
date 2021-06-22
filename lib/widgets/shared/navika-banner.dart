import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class NavikaBanner extends StatelessWidget {
  final String imagePath;
  final String caseName;
  final String description;
  final List<IconData> icons;

  const NavikaBanner({
    Key? key,
    required this.imagePath,
    required this.caseName,
    required this.description,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
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
                children: [
                  Text(
                    description,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
