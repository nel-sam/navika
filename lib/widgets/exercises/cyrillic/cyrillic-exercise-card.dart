import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cyrillic/cyrillic-state-item.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
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

  bool isDualLetter(String fullStr, int index) {
    if (fullStr.length <= index) return false;

    var compareToChar =
        fullStr.characters.characterAt(index).first.toLowerCase() +
            fullStr.characters.characterAt(index + 1).first.toLowerCase();

    if (compareToChar == 'lj' ||
        compareToChar == 'dž' ||
        compareToChar == 'nj') {
      return true;
    }

    return false;
  }

  int mapsUntilForCyrillicInput(String userInput, String latinString) {
    int latinIndex = 0, userInputIndex = 0;
    var maxLen = userInput.length < latinString.length
        ? userInput.length
        : latinString.length;

    for (; latinIndex < maxLen; latinIndex++, userInputIndex++) {
      var compareToChar =
          latinString.characters.characterAt(latinIndex).first.toLowerCase();

      var _isDualLetter = isDualLetter(latinString, latinIndex);

      if (_isDualLetter) {
        compareToChar +=
            getSubString(latinString, latinIndex + 1, latinIndex + 2);
      }

      var cyrChar = N.getCyrillicForLatin(compareToChar);
      var userEnteredChar =
          userInput.characters.characterAt(userInputIndex).first.toLowerCase();

      if (cyrChar != userEnteredChar) {
        return latinIndex - 1;
      }

      if (_isDualLetter) latinIndex++;
    }

    return latinIndex;
  }

  int getProgressIndex() {
    int index = 0;

    if (this.state.userInput.length == 0) return index;

    if (userInputsCyrillic) {
      index = mapsUntilForCyrillicInput(
          this.state.userInput, this.state.latinString);
    } else {
      // TODO: Finish this
    }

    return index;
  }

  String getSubString(String string, int start, int end) {
    var chars = string.characters.getRange(start, end);
    return chars.join();
  }

  @override
  Widget build(BuildContext context) {
    int progressIndex = getProgressIndex();
    var inputSub = getSubString(this.state.latinString, 0, progressIndex);

    // if (this.state.userInput.length > 0)
    //   log('Index: $progressIndex Input: ${this.state.userInput} ${inputSub}'); // Remove this

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
                  Row(
                    children: [
                      Text(
                        inputSub,
                        style: TextStyle(
                            color: CORRECT_COLOR,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(getSubString(this.state.latinString, progressIndex,
                          this.state.latinString.length)),
                    ],
                  ),
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
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: IconTextPair(
                icon: Icons.translate,
                text: this.state.getTranslation(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
