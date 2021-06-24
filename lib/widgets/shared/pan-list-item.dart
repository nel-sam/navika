import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

// ignore: must_be_immutable
class PANListItem extends StatefulWidget {
  final String sentenceStarter;
  final String sentenceEnder;

  final Adjective? possPronoun;
  final String? correctPossPronounValue;
  String? activePossPronounValue;

  final Adjective? adjective;
  final String? correctAdjValue;
  String? activeAdjValue;

  final Noun? noun;
  final String? correctNounValue;
  String? activeNounValue;

  final PersonalPronoun? personalPronoun;
  final String? correctPersonalPronounValue;
  String? activePersonalPronounValue;

  final Genders gender;
  final bool isPlural;

  PANListItem({
    required this.sentenceStarter,
    required this.sentenceEnder,
    this.possPronoun,
    this.correctPossPronounValue = '',
    this.activePossPronounValue = '',
    this.adjective,
    this.correctAdjValue = '',
    this.activeAdjValue = '',
    this.noun,
    this.activeNounValue = '',
    this.correctNounValue = '',
    this.personalPronoun,
    this.correctPersonalPronounValue = '',
    this.activePersonalPronounValue = '',
    required this.isPlural,
    required this.gender,
  });

  @override
  _PANListItemState createState() => _PANListItemState();
}

class _PANListItemState extends State<PANListItem> {
  bool checkAnswer() {
    // TODO: Support multiple correct answers (tvog/tvojog)
    var allCorrect = widget.activePossPronounValue ==
            widget.correctPossPronounValue &&
        widget.activeAdjValue == widget.correctAdjValue &&
        widget.activeNounValue == widget.correctNounValue &&
        widget.activePersonalPronounValue == widget.correctPersonalPronounValue;

    return allCorrect;
  }

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = checkAnswer();

    // TODO: Make freeform text possible

    var sentenceContent = [
      if (widget.sentenceStarter != '')
        Text(
          widget.sentenceStarter,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
        ),
      if (widget.correctPossPronounValue != '')
        CaseDropDown(
          activeValue: widget.activePossPronounValue!,
          correctValue: widget.correctPossPronounValue!,
          dropDownOptions: N.getDropdownItems(adjective: widget.possPronoun!),
          onChanged: (String newVal) {
            setState(() {
              widget.activePossPronounValue = newVal;
              isAllCorrect = checkAnswer();
            });
          },
        ),
      if (widget.correctAdjValue != '')
        CaseDropDown(
          activeValue: widget.activeAdjValue!,
          correctValue: widget.correctAdjValue!,
          dropDownOptions: N.getDropdownItems(adjective: widget.adjective!),
          onChanged: (String newVal) {
            setState(() {
              widget.activeAdjValue = newVal;
              isAllCorrect = checkAnswer();
            });
          },
        ),
      if (widget.correctNounValue != '')
        CaseDropDown(
          activeValue: widget.activeNounValue!,
          correctValue: widget.correctNounValue!,
          dropDownOptions: N.getDropdownItems(noun: widget.noun!),
          onChanged: (String newVal) {
            setState(() {
              widget.activeNounValue = newVal;
              isAllCorrect = checkAnswer();
            });
          },
        ),
      if (widget.correctPersonalPronounValue != '')
        CaseDropDown(
          activeValue: widget.activePersonalPronounValue!,
          correctValue: widget.correctPersonalPronounValue!,
          dropDownOptions:
              N.getDropdownItems(personalPronoun: widget.personalPronoun!),
          onChanged: (String newVal) {
            setState(() {
              widget.activePersonalPronounValue = newVal;
              isAllCorrect = checkAnswer();
            });
          },
        ),
      if (widget.sentenceEnder != '')
        Text(
          widget.sentenceEnder,
          style: TextStyle(fontSize: EXERCISE_FONT_STYLE),
        ),
    ];

    return ExerciseRowCard(
      isAllCorrect: isAllCorrect,
      isPlural: widget.isPlural,
      isAnimate: widget.noun == null ? false : widget.noun!.isAnimate,
      children: sentenceContent,
      gender: widget.gender,
    );
  }
}
