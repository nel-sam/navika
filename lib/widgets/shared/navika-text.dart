import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class NText extends StatelessWidget {
  final List<TextSpan> textSpans;
  final bool showborder;

  const NText(
    this.textSpans, {
    Key? key,
    this.showborder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showborder) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: ACCENT_COLOR),
            borderRadius: BorderRadius.all(
              Radius.circular(CELL_TEXT_PADDING),
            )),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SelectableText.rich(TextSpan(children: textSpans),
              textAlign: TextAlign.start),
        ),
      );
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: SelectableText.rich(TextSpan(children: textSpans),
            textAlign: TextAlign.start),
      ),
    );
  }
}
