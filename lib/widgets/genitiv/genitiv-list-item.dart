import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
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
      Text('To je '),
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
        activeValue: this.activeNoun1Value,
        correctValue: this.correctNoun1Value,
        dropDownOptions: WidgetHelpers.getNounDropdownItems(widget.noun1),
        onChanged: (String newVal) {
          setState(() {
            this.activeNoun1Value = newVal;
            this.isAllCorrect = checkAnswer();
          });
        },
      ),
      CaseDropDown(
        activeValue: this.activeNoun2Value,
        correctValue: this.correctNoun2Value,
        dropDownOptions: WidgetHelpers.getNounDropdownItems(widget.noun2),
        onChanged: (String newVal) {
          setState(() {
            this.activeNoun2Value = newVal;
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
