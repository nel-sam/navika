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
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
