import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/constants.dart';

class ExplanationIconCell extends StatelessWidget {
  final Widget icon;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: FONT_SIZE - 4),
          ),
        ],
      ),
    );
  }
}
