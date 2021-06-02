import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/answer-status-icon.dart';

class GenitivListItem extends StatefulWidget {
  Noun noun1;
  Noun noun2;
  bool isPlural;
  GenderEnum gender;
  DeclinableWord pronoun;

  String activePronounValue = '';
  String activeNoun1Value = '';
  String activeNoun2Value = '';

  String correctPronounValue = '';
  String correctNoun2Value = '';
  String correctNoun1Value = '';
  bool isAllCorrect = false;

  GenitivListItem(
      {required this.noun1,
      required this.isPlural,
      required this.pronoun,
      required this.gender,
      required this.noun2}) {
    this.activeNoun1Value = this.noun1.dictionary;
    this.activePronounValue = this.pronoun.dictionary;
    this.activeNoun2Value = this.noun2.dictionary;
    this.correctPronounValue = pronoun.getDeclension(
        gender, isPlural, CaseTypeEnum.Nominativ, noun2.isAnimate);
    this.correctNoun1Value =
        noun1.getDeclension(isPlural, CaseTypeEnum.Nominativ);
    this.correctNoun2Value =
        noun2.getDeclension(isPlural, CaseTypeEnum.Genitiv);
  }

  @override
  _GenitivListItemState createState() => _GenitivListItemState();
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

class _GenitivListItemState extends State<GenitivListItem> {
  bool checkAnswer() {
    return widget.activePronounValue == widget.correctPronounValue &&
        widget.activeNoun1Value == widget.correctNoun1Value &&
        widget.activeNoun2Value == widget.correctNoun2Value;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
        color: widget.isAllCorrect ? CORRECT_COLOR : WRONG_COLOR,
      )),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnswerStatusIcon(isCorrect: widget.isAllCorrect),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text('To je '),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Container(
                child: DropdownButton(
                  value: widget.activePronounValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                      height: 1,
                      color: widget.activePronounValue ==
                              widget.correctPronounValue
                          ? CORRECT_COLOR
                          : WRONG_COLOR),
                  onChanged: (String? newPronValue) {
                    setState(() {
                      widget.activePronounValue =
                          newPronValue != null ? newPronValue : "";
                      widget.isAllCorrect = checkAnswer();
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
                  value: widget.activeNoun1Value,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 1,
                    color: widget.activeNoun1Value == widget.correctNoun1Value
                        ? CORRECT_COLOR
                        : WRONG_COLOR,
                  ),
                  onChanged: (String? newNoun1Value) {
                    setState(() {
                      widget.activeNoun1Value =
                          newNoun1Value != null ? newNoun1Value : "";
                      widget.isAllCorrect = checkAnswer();
                    });
                  },
                  items: getNounDropdownItems(widget.noun1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Container(
                child: DropdownButton(
                  value: widget.activeNoun2Value,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 1,
                    color: widget.activeNoun2Value == widget.correctNoun2Value
                        ? CORRECT_COLOR
                        : WRONG_COLOR,
                  ),
                  onChanged: (String? newNoun2Value) {
                    setState(() {
                      widget.activeNoun2Value =
                          newNoun2Value != null ? newNoun2Value : "";
                      widget.isAllCorrect = checkAnswer();
                    });
                  },
                  items: getNounDropdownItems(widget.noun2),
                ),
              ),
            ),
            Row(children: [
              //Icon(WidgetHelpers.getGenderIcon(widget.gender)),
              Text(widget.isPlural ? '2+' : '1 '),
            ]),
          ],
        ),
      ),
    );
  }
}
