import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

// ignore: must_be_immutable
class PANListItem extends StatefulWidget {
  final String sentenceStarter;
  final String sentenceEnder;
  final DeclinableWord? adjective;
  final DeclinableWord? pronoun;
  final String? correctAdjValue;
  final String? correctPronounValue;
  final String correctNounValue;
  final GenderEnum gender;
  final bool isPlural;
  final Noun noun;

  String? activePronounValue;
  String? activeAdjValue;
  String activeNounValue;

  PANListItem({
    this.pronoun,
    this.adjective,
    required this.noun,
    this.activeAdjValue = '',
    this.activePronounValue = '',
    required this.activeNounValue,
    this.correctAdjValue = '',
    this.correctPronounValue = '',
    required this.correctNounValue,
    required this.sentenceStarter,
    required this.sentenceEnder,
    required this.isPlural,
    required this.gender,
  });

  @override
  _PANListItemState createState() => _PANListItemState();
}

class _PANListItemState extends State<PANListItem> {
  bool checkAnswer() {
    if (widget.noun.tags.contains(Tags.PersonalPronoun)) {
      return widget.activeNounValue == widget.correctNounValue;
    }

    return widget.activePronounValue == widget.correctPronounValue &&
        widget.activeAdjValue == widget.correctAdjValue &&
        widget.activeNounValue == widget.correctNounValue;
  }

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = checkAnswer();

    var sentenceContent = [
      if (widget.sentenceStarter != '')
        Text(
          widget.sentenceStarter,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
        ),
      if (widget.correctPronounValue != '')
        CaseDropDown(
          activeValue: widget.activePronounValue!,
          correctValue: widget.correctPronounValue!,
          dropDownOptions: N.getDropdownItems(widget.pronoun!),
          onChanged: (String newVal) {
            setState(() {
              widget.activePronounValue = newVal;
              isAllCorrect = checkAnswer();
            });
          },
        ),
      if (widget.correctAdjValue != '')
        CaseDropDown(
          activeValue: widget.activeAdjValue!,
          correctValue: widget.correctAdjValue!,
          dropDownOptions: N.getDropdownItems(widget.adjective!),
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
        dropDownOptions: N.getNounDropdownItems(widget.noun),
        onChanged: (String newVal) {
          setState(() {
            widget.activeNounValue = newVal;
            isAllCorrect = checkAnswer();
          });
        },
      ),
      if (widget.sentenceEnder != '')
        Text(
          widget.sentenceStarter,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
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
