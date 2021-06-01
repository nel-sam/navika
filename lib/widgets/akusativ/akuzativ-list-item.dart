import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/models.dart';

class AkuzativListItem extends StatefulWidget {
  DeclinableWord adjective;
  DeclinableWord pronoun;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  String activeAdjValue = '';
  String activePronounValue = '';
  String activeNounValue = '';
  String correctPronounValue = '';
  String correctAdjValue = '';
  String correctNounValue = '';
  bool isAllCorrect = false;

  AkuzativListItem(
      {required this.adjective,
      required this.isPlural,
      required this.pronoun,
      required this.gender,
      required this.noun}) {
    this.activeAdjValue = this.adjective.dictionary;
    this.activePronounValue = this.pronoun.dictionary;
    this.activeNounValue = this.noun.dictionary;
    this.correctPronounValue = pronoun.getDeclension(
        gender, isPlural, CaseTypeEnum.Akuzativ, noun.isAnimate);
    this.correctAdjValue = adjective.getDeclension(
        gender, isPlural, CaseTypeEnum.Akuzativ, noun.isAnimate);
    this.correctNounValue = noun.getDeclension(isPlural, CaseTypeEnum.Akuzativ);
  }

  @override
  _AkuzativListItemState createState() => _AkuzativListItemState();
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

class _AkuzativListItemState extends State<AkuzativListItem> {
  bool checkAnswer() {
    return widget.activePronounValue == widget.correctPronounValue &&
        widget.activeAdjValue == widget.correctAdjValue &&
        widget.activeNounValue == widget.correctNounValue;
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
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text('Ja vidim '),
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
                    color:
                        widget.activePronounValue == widget.correctPronounValue
                            ? CORRECT_COLOR
                            : WRONG_COLOR,
                  ),
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
                  value: widget.activeAdjValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 1,
                    color: widget.activeAdjValue == widget.correctAdjValue
                        ? CORRECT_COLOR
                        : WRONG_COLOR,
                  ),
                  onChanged: (String? newAdjValue) {
                    setState(() {
                      widget.activeAdjValue =
                          newAdjValue != null ? newAdjValue : "";
                      widget.isAllCorrect = checkAnswer();
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
                  value: widget.activeNounValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 1,
                    color: widget.activeNounValue == widget.correctNounValue
                        ? CORRECT_COLOR
                        : WRONG_COLOR,
                  ),
                  onChanged: (String? newNounValue) {
                    setState(() {
                      widget.activeNounValue =
                          newNounValue != null ? newNounValue : "";
                      widget.isAllCorrect = checkAnswer();
                    });
                  },
                  items: getNounDropdownItems(widget.noun),
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
