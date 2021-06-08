import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

// ignore: must_be_immutable
class InstrumentalListItem extends StatefulWidget {
  final DeclinableWord adjective;
  final DeclinableWord pronoun;
  final String correctAdjValue;
  final String correctPronounValue;
  final String correctNounValue;
  final GenderEnum gender;
  final bool isPlural;
  final Noun noun;

  String activeAdjValue;
  String activePronounValue;
  String activeNounValue;

  InstrumentalListItem(
      {required this.adjective,
      required this.correctAdjValue,
      required this.correctNounValue,
      required this.correctPronounValue,
      required this.activeAdjValue,
      required this.activePronounValue,
      required this.activeNounValue,
      required this.isPlural,
      required this.pronoun,
      required this.gender,
      required this.noun});
  @override
  _InstrumentalListItemState createState() => _InstrumentalListItemState();
}

class _InstrumentalListItemState extends State<InstrumentalListItem> {
  bool checkAnswer() {
    return widget.activePronounValue == widget.correctPronounValue &&
        widget.activeAdjValue == widget.correctAdjValue &&
        widget.activeNounValue == widget.correctNounValue;
  }

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = checkAnswer();

    var sentenceContent = [
      Text('Idem sa '),
      CaseDropDown(
        activeValue: widget.activePronounValue,
        correctValue: widget.correctPronounValue,
        dropDownOptions: WidgetHelpers.getDropdownItems(widget.pronoun),
        onChanged: (String newVal) {
          setState(() {
            widget.activePronounValue = newVal;
            isAllCorrect = checkAnswer();
          });
        },
      ),
      CaseDropDown(
        activeValue: widget.activeAdjValue,
        correctValue: widget.correctAdjValue,
        dropDownOptions: WidgetHelpers.getDropdownItems(widget.adjective),
        onChanged: (String newVal) {
          setState(() {
            widget.activeAdjValue = newVal;
            isAllCorrect = checkAnswer();
          });
        },
      ),
      CaseDropDown(
        activeValue: widget.activeNounValue,
        correctValue: widget.correctNounValue,
        dropDownOptions: WidgetHelpers.getNounDropdownItems(widget.noun),
        onChanged: (String newVal) {
          setState(() {
            widget.activeNounValue = newVal;
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
