import 'package:flutter/material.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';

class AkuzativListItem extends StatefulWidget {
  DeclinableWord adjective;
  DeclinableWord pronoun;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  String activeAdjValue = '';
  String activePronounValue = '';
  String activeNounValue = '';
  bool isCorrect = false;
  bool showHint = false;

  AkuzativListItem(
      {required this.adjective,
      required this.isPlural,
      required this.pronoun,
      required this.gender,
      required this.noun}) {
    this.activeAdjValue = this.adjective.dictionary;
    this.activePronounValue = this.pronoun.dictionary;
    this.activeNounValue = this.noun.dictionary;
  }

  @override
  _AkuzativListItemState createState() => _AkuzativListItemState();
}

List<DropdownMenuItem<String>> getNounDropdownItems(Noun noun) {
  var items = noun.GetUniqueDeclensions();
  return items
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();
}

List<DropdownMenuItem<String>> getDropdownItems(DeclinableWord word) {
  var items = word.GetUniqueDeclensions();
  return items
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();
}

bool checkAnswer(
    DeclinableWord pronoun,
    DeclinableWord adjective,
    Noun noun,
    GenderEnum gender,
    bool isPlural,
    String? newPronounValue,
    String? newAdjValue,
    String? newNounValue) {
  var adjAnswer = adjective.GetDeclension(
      gender, isPlural, CaseTypeEnum.Akuzativ, noun.isAnimate);
  var pronounAnswer = pronoun.GetDeclension(
      gender, isPlural, CaseTypeEnum.Akuzativ, noun.isAnimate);
  var nounAnswer = noun.GetDeclension(isPlural, CaseTypeEnum.Akuzativ);

  return newAdjValue == adjAnswer &&
      newPronounValue == pronounAnswer &&
      newNounValue == nounAnswer;
}

class _AkuzativListItemState extends State<AkuzativListItem> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
        color: widget.isCorrect ? Colors.blueGrey : Colors.red,
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
                  onChanged: (String? newPronValue) {
                    setState(() {
                      widget.activePronounValue =
                          newPronValue != null ? newPronValue : "";

                      bool isCorrect = checkAnswer(
                        widget.pronoun,
                        widget.adjective,
                        widget.noun,
                        widget.gender,
                        widget.isPlural,
                        newPronValue,
                        widget.activeAdjValue,
                        widget.activeNounValue,
                      );

                      widget.isCorrect = isCorrect;
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
                  onChanged: (String? newAdjValue) {
                    setState(() {
                      widget.activeAdjValue =
                          newAdjValue != null ? newAdjValue : "";

                      bool isCorrect = checkAnswer(
                        widget.pronoun,
                        widget.adjective,
                        widget.noun,
                        widget.gender,
                        widget.isPlural,
                        widget.activePronounValue,
                        newAdjValue,
                        widget.activeNounValue,
                      );

                      widget.isCorrect = isCorrect;
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
                  onChanged: (String? newNounValue) {
                    setState(() {
                      widget.activeNounValue =
                          newNounValue != null ? newNounValue : "";

                      bool isCorrect = checkAnswer(
                        widget.pronoun,
                        widget.adjective,
                        widget.noun,
                        widget.gender,
                        widget.isPlural,
                        widget.activePronounValue,
                        widget.activeAdjValue,
                        newNounValue,
                      );

                      widget.isCorrect = isCorrect;
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
