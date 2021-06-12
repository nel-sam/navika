import 'package:flutter/material.dart';

class NText extends StatelessWidget {
  final List<TextSpan> textSpans;

  const NText(
    this.textSpans, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(TextSpan(children: textSpans),
        textAlign: TextAlign.start);
  }
}
