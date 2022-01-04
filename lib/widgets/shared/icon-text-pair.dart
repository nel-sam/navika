import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class IconTextPair extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextPair({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconPadding = 4;

    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: iconPadding),
            child: Icon(
              icon,
              color: ACCENT_COLOR,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
