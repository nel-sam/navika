import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class ExplanationIconCell extends StatelessWidget {
  final IconData icon;
  final String tooltip;

  const ExplanationIconCell({
    Key? key,
    required this.icon,
    required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TABLE_CELL_PADDING,
      child: Container(
        child: Tooltip(
          message: tooltip,
          child: Icon(
            icon,
            color: ICON_COLOR,
          ),
        ),
      ),
    );
  }
}
