import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/answer-status-icon.dart';

class DativListItem extends StatefulWidget {
  final DeclinableWord adjective;
  final DeclinableWord pronoun;
  final GenderEnum gender;
  final bool isPlural;
  final Noun noun;

  DativListItem(
      {required this.adjective,
      required this.isPlural,
      required this.pronoun,
      required this.gender,
      required this.noun});

  @override
  _DativListItemState createState() => _DativListItemState();
}

List<DropdownMenuItem<String>> getNounDropdownItems(Noun noun) {
  var items = noun.getUniqueDeclensions();
  return items
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();
}

List<DropdownMenuItem<String>> getDropdownItems(DeclinableWord word) {
  var items = word.getUniqueDeclensions();
  return items
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();
}

class _DativListItemState extends State<DativListItem> {
  String activeAdjValue = '';
  String activePronounValue = '';
  String activeNounValue = '';
  String correctPronounValue = '';
  String correctAdjValue = '';
  String correctNounValue = '';
  bool isAllCorrect = false;

  _DativListItemState() {
    this.activeAdjValue = widget.adjective.dictionary;
    this.activePronounValue = widget.pronoun.dictionary;
    this.activeNounValue = widget.noun.dictionary;
    this.correctPronounValue = widget.pronoun.getDeclension(widget.gender,
        widget.isPlural, CaseTypeEnum.Dativ, widget.noun.isAnimate);
    this.correctAdjValue = widget.adjective.getDeclension(widget.gender,
        widget.isPlural, CaseTypeEnum.Dativ, widget.noun.isAnimate);
    this.correctNounValue =
        widget.noun.getDeclension(widget.isPlural, CaseTypeEnum.Dativ);
  }

  bool checkAnswer() {
    return this.activePronounValue == this.correctPronounValue &&
        this.activeAdjValue == this.correctAdjValue &&
        this.activeNounValue == this.correctNounValue;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: this.isAllCorrect ? CORRECT_COLOR : WRONG_COLOR,
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnswerStatusIcon(isCorrect: this.isAllCorrect),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(getSentenceStarter()),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Container(
                child: DropdownButton(
                  value: this.activePronounValue == ''
                      ? widget.pronoun.dictionary
                      : this.activePronounValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                      height: 1,
                      color: this.activePronounValue == this.correctPronounValue
                          ? CORRECT_COLOR
                          : WRONG_COLOR),
                  onChanged: (String? newPronValue) {
                    setState(() {
                      this.activePronounValue =
                          newPronValue != null ? newPronValue : "";
                      this.isAllCorrect = checkAnswer();
                    });
                  },
                  items: getDropdownItems(widget.pronoun),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Container(
                child: DropdownButton(
                  value: this.activeAdjValue == ''
                      ? widget.adjective.dictionary
                      : this.activeAdjValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 1,
                    color: this.activeAdjValue == this.correctAdjValue
                        ? CORRECT_COLOR
                        : WRONG_COLOR,
                  ),
                  onChanged: (String? newAdjValue) {
                    setState(() {
                      this.activeAdjValue =
                          newAdjValue != null ? newAdjValue : "";
                      this.isAllCorrect = checkAnswer();
                    });
                  },
                  items: getDropdownItems(widget.adjective),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Container(
                child: DropdownButton(
                  value: this.activeNounValue == ''
                      ? widget.noun.dictionary
                      : this.activeNounValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 1,
                    color: this.activeNounValue == this.correctNounValue
                        ? CORRECT_COLOR
                        : WRONG_COLOR,
                  ),
                  onChanged: (String? newNounValue) {
                    setState(() {
                      this.activeNounValue =
                          newNounValue != null ? newNounValue : "";
                      this.isAllCorrect = checkAnswer();
                    });
                  },
                  items: getNounDropdownItems(widget.noun),
                ),
              ),
            ),
            Row(children: [
              //Icon(WidgetHelpers.getGenderIcon(this.gender)),
              Icon(widget.isPlural ? PLURAL_ICON : SINGULAR_ICON)
            ]),
          ],
        ),
      ),
    );
  }

  String getSentenceStarter() {
    if (widget.noun.isAnimate) return 'Daj ';
    if (widget.isPlural) return 'Slični su ';
    return 'Slično je ';
  }
}
