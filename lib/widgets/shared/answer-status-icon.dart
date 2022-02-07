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
    final icon = getIcon(status);

    return Padding(
      padding: const EdgeInsets.all(4),
      child: icon,
    );
  }

  static Icon getIcon(CorrectStatus status) {
    final neutralStateIcon = Icons.circle_outlined;
    switch (status) {
      case CorrectStatus.correct:
        return Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR);
      case CorrectStatus.wrong:
        return Icon(WRONG_ANSWER_ICON, color: WRONG_COLOR);
      case CorrectStatus.unstarted:
        return Icon(neutralStateIcon);
      case CorrectStatus.inprogressCorrect:
        return Icon(neutralStateIcon, color: ACCENT_COLOR);
    }
  }
}
