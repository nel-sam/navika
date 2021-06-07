import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

class NominativListItem extends StatefulWidget {
  final DeclinableWord adjective;
  final String correctAdjValue;
  final String correctNounValue;
  final GenderEnum gender;
  final bool isPlural;
  final Noun noun;

  String activeAdjValue;
  String activeNounValue;

  NominativListItem(
      {required this.adjective,
      required this.correctAdjValue,
      required this.correctNounValue,
      required this.activeAdjValue,
      required this.activeNounValue,
      required this.isPlural,
      required this.gender,
      required this.noun});

  @override
  _NominativListItemState createState() => _NominativListItemState();
}

class _NominativListItemState extends State<NominativListItem> {
  bool checkAnswer() {
    return widget.activeAdjValue == widget.correctAdjValue &&
        widget.activeNounValue == widget.correctNounValue;
  }

  @override
  Widget build(BuildContext context) {
    bool isAllCorrect = checkAnswer();

    var sentenceContent = [
      Text('To je '),
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
