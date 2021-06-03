import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';

class ExplanationTextCell extends StatelessWidget {
  final List<TextSpan> children;

  const ExplanationTextCell({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TABLE_CELL_PADDING,
      child: TableCell(
        child: Container(
          child: RichText(
            text: TextSpan(
              style: TABLE_CELL_TEXT_STYLE,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
