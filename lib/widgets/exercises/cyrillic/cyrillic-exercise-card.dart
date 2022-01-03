import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cyrillic/cyrillic-state-item.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/extensions.dart';
import 'package:navika/widgets/shared/question-free-form-multi-status.dart';
import 'package:navika/widgets/shared/shadow-box.dart';

class CyrillicExerciseCard extends StatelessWidget {
  final CyrillicStateItem state;
  final bool userInputsCyrillic;

  const CyrillicExerciseCard({
    Key? key,
    required this.state,
    this.userInputsCyrillic = true,
  }) : super(key: key);

  bool getIsAllCorrect(String userInput) {
    if (userInputsCyrillic)
      return this.state.cyrillicString.equalsCaseInsensitive(userInput);
    else
      return this.state.latinString.equalsCaseInsensitive(userInput);
  }

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      isCorrect: getIsAllCorrect(this.state.userInput),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: getIsAllCorrect(this.state.userInput)
                  ? Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
                  : Icon(WRONG_ANSWER_ICON, color: WRONG_COLOR),
            ),
            if (userInputsCyrillic)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NText([N.NTextSpan(this.state.latinString)]),
                  QuestionFreeFormMultiStatus(
                    activeValue: this.state.userInput,
                    correctValues: [this.state.cyrillicString],
                    hintValue: '',
                    onChanged: (newVal) {
                      this.state.updateInput(newVal);
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
