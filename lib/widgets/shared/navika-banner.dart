import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

// ignore: non_constant_identifier_names
Widget NavikaBanner({
  required String imagePath,
  required String caseName,
  required String description,
  required List<IconData> icons,
}) {
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
