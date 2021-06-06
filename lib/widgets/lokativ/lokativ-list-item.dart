import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

class LokativListItem extends StatefulWidget {
  final DeclinableWord adjective;
  final DeclinableWord pronoun;
  final GenderEnum gender;
  final bool isPlural;
  final Noun noun;

  LokativListItem(
      {required this.adjective,
      required this.isPlural,
      required this.pronoun,
      required this.gender,
      required this.noun});

  @override
  _LokativListItemState createState() => _LokativListItemState();
}

class _LokativListItemState extends State<LokativListItem> {
  late String activeAdjValue;
  late String activePronounValue;
  late String activeNounValue;

  late String correctPronounValue;
  late String correctAdjValue;
  late String correctNounValue;
  bool isAllCorrect = false;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    this.correctPronounValue = widget.pronoun.getDeclension(widget.gender,
        widget.isPlural, CaseTypeEnum.Lokativ, widget.noun.isAnimate);
    this.correctAdjValue = widget.adjective.getDeclension(widget.gender,
        widget.isPlural, CaseTypeEnum.Lokativ, widget.noun.isAnimate);
    this.correctNounValue =
        widget.noun.getDeclension(widget.isPlural, CaseTypeEnum.Lokativ);

    this.activeAdjValue = widget.adjective.getRandomDeclension();
    this.activePronounValue = widget.pronoun.getRandomDeclension();
    this.activeNounValue = widget.noun.getRandomDeclension();
  }

  bool checkAnswer() {
    return this.activePronounValue == this.correctPronounValue &&
        this.activeAdjValue == this.correctAdjValue &&
        this.activeNounValue == this.correctNounValue;
  }

  @override
  Widget build(BuildContext context) {
    var sentenceContent = [
      Text('Govori o '),
      CaseDropDown(
        activeValue: this.activePronounValue,
        correctValue: this.correctPronounValue,
        dropDownOptions: WidgetHelpers.getDropdownItems(widget.pronoun),
        onChanged: (String newVal) {
          setState(() {
            this.activePronounValue = newVal;
            this.isAllCorrect = checkAnswer();
          });
        },
      ),
      CaseDropDown(
        activeValue: this.activeAdjValue,
        correctValue: this.correctAdjValue,
        dropDownOptions: WidgetHelpers.getDropdownItems(widget.adjective),
        onChanged: (String newVal) {
          setState(() {
            this.activeAdjValue = newVal;
            this.isAllCorrect = checkAnswer();
          });
        },
      ),
      CaseDropDown(
        activeValue: this.activeNounValue,
        correctValue: this.correctNounValue,
        dropDownOptions: WidgetHelpers.getNounDropdownItems(widget.noun),
        onChanged: (String newVal) {
          setState(() {
            this.activeNounValue = newVal;
            this.isAllCorrect = checkAnswer();
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
