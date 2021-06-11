import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class ExplanationIconCell extends StatelessWidget {
  final IconData icon;
  final double width;

  const ExplanationIconCell({
    Key? key,
    required this.icon,
    this.width = 90,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TABLE_CELL_PADDING,
      child: Container(
        width: width,
        child: Icon(
          icon,
          color: ICON_COLOR,
        ),
      ),
    );
  }
}
