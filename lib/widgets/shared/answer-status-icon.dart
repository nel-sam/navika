import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';

class AnswerStatusIcon extends StatelessWidget {
  final CorrectStatus status;

  const AnswerStatusIcon({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: status == CorrectStatus.correct
          ? Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
          : Icon(WRONG_ANSWER_ICON, color: ACCENT_COLOR),
    );
  }
}
