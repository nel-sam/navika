import 'package:flutter/material.dart';

class NTextSpan extends StatelessWidget {
  final String text;
  final bool isBold;
  final bool isItalic;
  final Color color;
  final bool attachNewline;

  const NTextSpan({
    Key? key,
    required this.text,
    this.attachNewline = false,
    this.isBold = false,
    this.isItalic = false,
    this.color = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle;
    var finalText = text;

    if (isBold && isItalic && color != Colors.transparent) {
      textStyle = TextStyle(
        color: this.color,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      );
    } else if (isBold && color != Colors.transparent) {
      textStyle = TextStyle(
        color: this.color,
        fontWeight: FontWeight.bold,
      );
    } else if (isBold) {
      textStyle = TextStyle(
        fontWeight: FontWeight.bold,
      );
    }

    if (attachNewline) {
      finalText = finalText + '\n';
    }

    return SelectableText.rich(TextSpan(text: finalText, style: textStyle));
  }
}
