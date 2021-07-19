import 'package:flutter/material.dart';
import 'package:navika/utilities/navika-helpers.dart';

class ExplanationTextCell extends StatelessWidget {
  final List<TextSpan> children;

  const ExplanationTextCell({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              fontSize: 16,
              color: N.isDarkTheme(context) ? Colors.white : Colors.black),
          children: children,
        ),
      ),
    );
  }
}
