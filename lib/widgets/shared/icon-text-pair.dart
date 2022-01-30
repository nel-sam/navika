import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class IconTextPair extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final MainAxisAlignment alignment;

  IconTextPair(
      {Key? key,
      required this.icon,
      required this.text,
      this.alignment = MainAxisAlignment.start,
      this.color = ACCENT_COLOR})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconPadding = 4;

    return Container(
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: iconPadding),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: iconPadding),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
