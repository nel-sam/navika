import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/answer-status-icon.dart';

class ExerciseRowCard extends StatelessWidget {
  final bool isAllCorrect;
  final List<Widget> children;
  final bool isPlural;
  final GenderEnum gender;

  const ExerciseRowCard({
    Key? key,
    required this.isAllCorrect,
    required this.children,
    required this.isPlural,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
        color: this.isAllCorrect ? CORRECT_COLOR : WRONG_COLOR,
      )),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnswerStatusIcon(isCorrect: this.isAllCorrect),
            ...children,
            Row(children: [
              Icon(WidgetHelpers.getGenderIcon(this.gender)),
              Icon(isPlural ? PLURAL_ICON : SINGULAR_ICON)
            ])
          ],
        ),
      ),
    );
  }
}
