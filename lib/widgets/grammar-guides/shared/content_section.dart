import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/constants.dart';

class ContentSection extends StatelessWidget {
  final String text;
  final Widget content;

  const ContentSection({Key? key, required this.text, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: FONT_SIZE * 2.5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: FONT_SIZE),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: FONT_SIZE * 2.5),
                ),
              ],
            ),
          ),
          content,
        ],
      ),
    );
  }
}
