import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';

class NText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final bool isBold;
  final double fontSize;

  NText(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.start,
    this.isBold = false,
    this.fontSize = FONT_SIZE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: SelectableText.rich(
          this.isBold
              ? TextSpan(text: text, style: N.fontStyleBold(fontSize: fontSize))
              : TextSpan(
                  text: text, style: N.fontStyleNormal(fontSize: fontSize)),
          textAlign: textAlign,
        ),
      ),
    );
  }
}
