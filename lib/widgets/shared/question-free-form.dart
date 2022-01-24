import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/extensions.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';

class QuestionFreeForm extends StatelessWidget {
  final String hintValue;
  final String activeValue;
  final List<String> correctValues;
  final bool isHalfWidth;
  final Function(String) onChanged;

  QuestionFreeForm({
    Key? key,
    required this.hintValue,
    required this.onChanged,
    required this.activeValue,
    required this.correctValues,
    this.isHalfWidth = false,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = activeValue;
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    var screenWidth = N.getScreenWidth(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        width: isHalfWidth ? (screenWidth / 2) - 60 : screenWidth - 80,
        child: TextField(
          key: key,
          controller: controller,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
            labelText: correctValues.containsCaseInsensitive(activeValue)
                ? ''
                : hintValue,
            enabledBorder: getBorder(),
            focusedBorder: getBorder(),
          ),
          onChanged: (String? newVal) {
            if (newVal == ' ') newVal = '';

            if (newVal != null) {
              onChanged(newVal);
            }
          },
        ),
      ),
    );
  }

  CorrectStatus getCorrectStatus(String userInput) {
    if (userInput.length == 0) {
      return CorrectStatus.unstarted;
    }

    if (correctValues.containsCaseInsensitive(userInput)) {
      return CorrectStatus.correct;
    }

    if (correctValues.containsSubCaseInsensitive(userInput)) {
      return CorrectStatus.inprogressCorrect;
    }

    return CorrectStatus.wrong;
  }

  OutlineInputBorder getBorder() {
    var status = getCorrectStatus(activeValue);

    var color = WRONG_COLOR;

    switch (status) {
      case CorrectStatus.correct:
        color = CORRECT_COLOR;
        break;
      case CorrectStatus.wrong:
        color = WRONG_COLOR;
        break;
      case CorrectStatus.unstarted:
        color = Colors.grey;
        break;
      case CorrectStatus.inprogressCorrect:
        color = ACCENT_COLOR;
        break;
    }

    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
