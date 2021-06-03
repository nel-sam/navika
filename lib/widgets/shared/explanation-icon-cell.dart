import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';

class ExplanationIconCell extends StatelessWidget {
  final IconData icon;

  const ExplanationIconCell({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TABLE_CELL_PADDING,
      child: TableCell(
        child: Container(
          child: Icon(
            icon,
            color: ICON_COLOR,
          ),
        ),
      ),
    );
  }
}
