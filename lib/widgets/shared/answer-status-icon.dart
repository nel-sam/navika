import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';

class AnswerStatusIcon extends StatelessWidget {
  final bool isCorrect;
  const AnswerStatusIcon({
    Key? key,
    required this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
        child: isCorrect
            ? Icon(
                Icons.check_circle_outline,
                color: CORRECT_COLOR,
              )
            : Icon(Icons.cancel_sharp, color: WRONG_COLOR));
  }
}
