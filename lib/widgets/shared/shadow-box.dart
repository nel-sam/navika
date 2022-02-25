import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class ShadowBox extends StatelessWidget {
  final Widget child;
  final bool isCorrect;

  const ShadowBox({Key? key, required this.child, required this.isCorrect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = Nrs.isDarkTheme(context)
        ? Theme.of(context).backgroundColor
        : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: this.isCorrect ? CORRECT_COLOR : WRONG_COLOR,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
