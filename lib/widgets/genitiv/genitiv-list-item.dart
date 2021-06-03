import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

class GenitivListItem extends StatefulWidget {
  final Noun noun1;
  final Noun noun2;
  final bool isPlural;
  final GenderEnum gender;
  final DeclinableWord pronoun;

  GenitivListItem(
      {required this.noun1,
      required this.isPlural,
      required this.pronoun,
      required this.gender,
      required this.noun2});

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
  late String activePronounValue;
  late String activeNoun1Value;
  late String activeNoun2Value;

  late String correctPronounValue;
  late String correctNoun2Value;
  late String correctNoun1Value;
  bool isAllCorrect = false;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    this.activeNoun1Value = widget.noun1.dictionary;
    this.activePronounValue = widget.pronoun.dictionary;
    this.activeNoun2Value = widget.noun2.dictionary;
    this.correctPronounValue = widget.pronoun.getDeclension(widget.gender,
        widget.isPlural, CaseTypeEnum.Nominativ, widget.noun2.isAnimate);
    this.correctNoun1Value =
        widget.noun1.getDeclension(widget.isPlural, CaseTypeEnum.Nominativ);
    this.correctNoun2Value =
        widget.noun2.getDeclension(widget.isPlural, CaseTypeEnum.Genitiv);
  }

  bool checkAnswer() {
    return this.activePronounValue == this.correctPronounValue &&
        this.activeNoun1Value == this.correctNoun1Value &&
        this.activeNoun2Value == this.correctNoun2Value;
  }

  @override
  Widget build(BuildContext context) {
    var sentenceContent = [
      Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Text('To je '),
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
            value: this.activeNoun1Value == ''
                ? widget.noun1.dictionary
                : this.activeNoun1Value,
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 1,
              color: this.activeNoun1Value == this.correctNoun1Value
                  ? CORRECT_COLOR
                  : WRONG_COLOR,
            ),
            onChanged: (String? newNoun1Value) {
              setState(() {
                this.activeNoun1Value =
                    newNoun1Value != null ? newNoun1Value : "";
                this.isAllCorrect = checkAnswer();
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
            value: this.activeNoun2Value == ''
                ? widget.noun2.dictionary
                : this.activeNoun2Value,
            iconSize: 24,
            elevation: 16,
            underline: Container(
              height: 1,
              color: this.activeNoun2Value == this.correctNoun2Value
                  ? CORRECT_COLOR
                  : WRONG_COLOR,
            ),
            onChanged: (String? newNoun2Value) {
              setState(() {
                this.activeNoun2Value =
                    newNoun2Value != null ? newNoun2Value : "";
                this.isAllCorrect = checkAnswer();
              });
            },
            items: getNounDropdownItems(widget.noun2),
          ),
        ),
      )
    ];

    return ExerciseRowCard(
      isAllCorrect: isAllCorrect,
      isPlural: widget.isPlural,
      children: sentenceContent,
      gender: widget.gender,
    );
  }
}
