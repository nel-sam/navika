import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class ExplanationIconCell extends StatelessWidget {
  final IconData icon;
  final String label;

  const ExplanationIconCell({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TABLE_CELL_PADDING,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: ACCENT_COLOR),
            Text(
              label,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
