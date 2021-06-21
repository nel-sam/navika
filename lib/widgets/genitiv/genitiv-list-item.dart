import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

// TODO: Can Genitiv now use the standard PANListItem widget?
// ignore: must_be_immutable
class GenitivListItem extends StatefulWidget {
  final Noun noun1;
  final Noun noun2;
  final bool isPlural;
  final GenderEnum gender;
  final DeclinableWord pronoun;
  final String sentenceStarter;
  final String sentenceEnder;

  final String correctPronounValue;
  final String correctNoun1Value;
  final String correctNoun2Value;

  String activeNoun1Value;
  String activePronounValue;
  String activeNoun2Value;

  GenitivListItem({
    required this.noun1,
    required this.sentenceStarter,
    this.sentenceEnder = '',
    required this.correctPronounValue,
    required this.correctNoun1Value,
    required this.correctNoun2Value,
    required this.activeNoun1Value,
    required this.activePronounValue,
    required this.activeNoun2Value,
    required this.isPlural,
    required this.pronoun,
    required this.gender,
    required this.noun2,
  });

  @override
  _GenitivListItemState createState() => _GenitivListItemState();
}

class _GenitivListItemState extends State<GenitivListItem> {
  bool checkAnswer() {
    return widget.activePronounValue == widget.correctPronounValue &&
        widget.activeNoun1Value == widget.correctNoun1Value &&
        widget.activeNoun2Value == widget.correctNoun2Value;
  }

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = checkAnswer();
    var sentenceContent = [
      Text('To je '),
      CaseDropDown(
        activeValue: widget.activePronounValue,
        correctValue: widget.correctPronounValue,
        dropDownOptions: N.getDropdownItems(widget.pronoun),
        onChanged: (String newVal) {
          setState(() {
            widget.activePronounValue = newVal;
            isAllCorrect = checkAnswer();
          });
        },
      ),
      CaseDropDown(
        activeValue: widget.activeNoun1Value,
        correctValue: widget.correctNoun1Value,
        dropDownOptions: N.getNounDropdownItems(widget.noun1),
        onChanged: (String newVal) {
          setState(() {
            widget.activeNoun1Value = newVal;
            isAllCorrect = checkAnswer();
          });
        },
      ),
      CaseDropDown(
        activeValue: widget.activeNoun2Value,
        correctValue: widget.correctNoun2Value,
        dropDownOptions: N.getNounDropdownItems(widget.noun2),
        onChanged: (String newVal) {
          setState(() {
            widget.activeNoun2Value = newVal;
            isAllCorrect = checkAnswer();
          });
        },
      ),
    ];

    return ExerciseRowCard(
      isAllCorrect: isAllCorrect,
      isPlural: widget.isPlural,
      children: sentenceContent,
      gender: widget.gender,
    );
  }
}
