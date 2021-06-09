import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/widget-helpers.dart';

class ExplanationTextCell extends StatelessWidget {
  final List<TextSpan> children;
  final double width;

  const ExplanationTextCell({
    Key? key,
    required this.children,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TABLE_CELL_PADDING,
      child: Container(
        width: width,
        child: RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: 16,
                color: WidgetHelpers.isDarkTheme(context)
                    ? Colors.white
                    : Colors.black),
            children: children,
          ),
        ),
      ),
    );
  }
}
