import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/state/cyrillic/cyrillic-state-item.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-chart.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:navika/extensions.dart';
import 'package:navika/widgets/shared/question-free-form.dart';
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

  int getContainsCount(String fullStr, String charToSearch) {
    int foundCount = 0;

    for (int i = 0; i < fullStr.length; i++) {
      if (getSubString(fullStr, i, i + 1).toLowerCase() == charToSearch) {
        foundCount++;
      }
    }

    return foundCount;
  }

  int getProgressIndex() {
    if (this.state.userInput.length == 0) return 0;

    var correct =
        this.state.cyrillicString.containsCaseInsensitive(this.state.userInput);

    if (!correct) return 0;

    int index = this.state.userInput.length;
    var loweredCyr =
        getSubString(this.state.cyrillicString.toLowerCase(), 0, index);

    int ljCount = getContainsCount(loweredCyr, 'љ');
    int njCount = getContainsCount(loweredCyr, 'њ');
    int dzCount = getContainsCount(loweredCyr, 'џ');

    return index + ljCount + njCount + dzCount;
  }

  String getSubString(String string, int start, int end) {
    var chars = string.characters.getRange(start, end);
    return chars.join();
  }

  @override
  Widget build(BuildContext context) {
    int progressIndex = getProgressIndex();
    var highlightSub = getSubString(this.state.latinString, 0, progressIndex);

    return ShadowBox(
      isCorrect: getIsAllCorrect(this.state.userInput),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeader(context),
            if (userInputsCyrillic)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        highlightSub,
                        style: TextStyle(
                            color: CORRECT_COLOR,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(getSubString(this.state.latinString, progressIndex,
                          this.state.latinString.length)),
                    ],
                  ),
                  QuestionFreeForm(
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

  Widget getHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: getIsAllCorrect(this.state.userInput)
              ? Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
              : Icon(WRONG_ANSWER_ICON, color: WRONG_COLOR),
        ),
        OutlinedButton(
          child: Icon(Icons.info),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CyrillicChart(
                  cyrillicString: this.state.cyrillicString,
                  latinString: this.state.latinString,
                ),
              ),
            ),
          },
        )
      ],
    );
  }
}
