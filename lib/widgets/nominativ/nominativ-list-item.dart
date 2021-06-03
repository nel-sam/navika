import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

class NominativListItem extends StatefulWidget {
  final DeclinableWord adjective;
  final GenderEnum gender;
  final bool isPlural;
  final Noun noun;

  NominativListItem(
      {required this.adjective,
      required this.isPlural,
      required this.gender,
      required this.noun});

  @override
  _NominativListItemState createState() => _NominativListItemState();
}

class _NominativListItemState extends State<NominativListItem> {
  bool isAllCorrect = false;
  bool showHint = false;
  late String activeAdjValue;
  late String activeNounValue;

  late String correctAdjValue;
  late String correctNounValue;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    this.correctAdjValue = widget.adjective.getDeclension(widget.gender,
        widget.isPlural, CaseTypeEnum.Nominativ, widget.noun.isAnimate);
    this.correctNounValue =
        widget.noun.getDeclension(widget.isPlural, CaseTypeEnum.Nominativ);
    this.activeAdjValue = widget.adjective.getRandomDeclension();
    this.activeNounValue = widget.noun.getRandomDeclension();
  }

  bool checkAnswer() {
    return this.activeAdjValue == this.correctAdjValue &&
        this.activeNounValue == this.correctNounValue;
  }

  @override
  Widget build(BuildContext context) {
    var sentenceContent = [
      Text('To je '),
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
