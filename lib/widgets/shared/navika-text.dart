import 'package:flutter/material.dart';

class NText extends StatelessWidget {
  final List<TextSpan> textSpans;
  final TextAlign textAlign;

  const NText(
    this.textSpans, {
    Key? key,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: SelectableText.rich(TextSpan(children: textSpans),
            textAlign: textAlign),
      ),
    );
  }
}
