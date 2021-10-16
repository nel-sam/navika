import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';

class ShadowBox extends StatelessWidget {
  final Widget child;
  final bool isCorrect;

  const ShadowBox({Key? key, required this.child, required this.isCorrect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = N.isDarkTheme(context)
        ? Theme.of(context).backgroundColor
        : Colors.white;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: this.isCorrect
                ? CORRECT_COLOR.withOpacity(0.4)
                : WRONG_COLOR.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 10),
      child: child,
    );
  }
}
