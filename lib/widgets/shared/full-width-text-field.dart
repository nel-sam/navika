import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/extensions.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/answer-status-icon.dart';

class FullWidthTextField extends StatelessWidget {
  final String hintValue;
  final String activeValue;
  final List<String> correctValues;
  final Function(String) onChanged;
  final controller = TextEditingController();

  FullWidthTextField({
    Key? key,
    required this.hintValue,
    required this.onChanged,
    required this.activeValue,
    required this.correctValues,
  }) : super(key: key) {
    controller.text = activeValue;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final status = getCorrectStatus(activeValue);

    OutlineInputBorder border = getBorder(status);
    String labelText =
        correctValues.containsCaseInsensitive(activeValue) ? '' : hintValue;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: N.getScreenWidth(reduction: 100),
            child: TextField(
              key: key,
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(4, 18, 0, 1),
                labelText: labelText,
                enabledBorder: border,
                focusedBorder: border,
              ),
              onChanged: (String? newVal) {
                if (newVal == ' ') newVal = '';

                if (newVal != null) {
                  onChanged(newVal);
                }
              },
            ),
          ),
          AnswerStatusIcon(status: status),
        ],
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

  OutlineInputBorder getBorder(CorrectStatus status) {
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
