import 'package:flutter/material.dart';
import 'package:navika/state/cyrillic/cyrillic-state-item.dart';
import 'package:navika/widgets/exercises/cyrillic/cyrillic-chart.dart';
import 'package:navika/widgets/shared/n-free-form-entry.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/extensions.dart';

class CyrillicExerciseCard extends StatelessWidget {
  final CyrillicStateItem state;
  final bool userInputsCyrillic;

  const CyrillicExerciseCard({
    Key? key,
    required this.state,
    this.userInputsCyrillic = true,
  }) : super(key: key);

  // TODO: Verify sentences are good
  @override
  Widget build(BuildContext context) {
    int progressIndex = getProgressIndex();
    var highlightSub = getSubString(this.state.latinString, 0, progressIndex);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userInputsCyrillic)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(this.state.getTranslation(context),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text(
                              highlightSub,
                              style: TextStyle(
                                  color: CORRECT_COLOR,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(getSubString(this.state.latinString,
                                progressIndex, this.state.latinString.length)),
                          ],
                        ),
                      ],
                    ),
                    OutlinedButton(
                      child: Icon(Icons.info),
                      onPressed: () {
                        final dest = CyrillicChart(
                          cyrillicString: this.state.cyrillicString,
                          latinString: this.state.latinString,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => dest,
                          ),
                        );
                      },
                    )
                  ],
                ),
                NFreeFormEntry(
                  showHintString: false,
                  widthType: NFreeFormWidths.full,
                  initialValue: this.state.userInput,
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
    );
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

  bool getIsAllCorrect(String userInput) {
    if (userInputsCyrillic)
      return this.state.cyrillicString.equalsCaseInsensitive(userInput);
    else
      return this.state.latinString.equalsCaseInsensitive(userInput);
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
}
