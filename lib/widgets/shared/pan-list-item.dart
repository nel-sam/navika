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

  final Adjective? pronoun;
  final String? correctPronounValue;
  String? activePronounValue;

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
    this.pronoun,
    this.correctPronounValue = '',
    this.activePronounValue = '',
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
    return widget.activePronounValue == widget.correctPronounValue &&
        widget.activeAdjValue == widget.correctAdjValue &&
        widget.activeNounValue == widget.correctNounValue &&
        widget.activePersonalPronounValue == widget.correctPersonalPronounValue;
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
          dropDownOptions: N.getAdjectiveDropdownItems(widget.pronoun!),
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
          dropDownOptions: N.getAdjectiveDropdownItems(widget.adjective!),
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
          dropDownOptions: N.getNounDropdownItems(widget.noun!),
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
              N.getPersonalPronounDropdownItems(widget.personalPronoun!),
          onChanged: (String newVal) {
            setState(() {
              widget.activePersonalPronounValue = newVal;
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
