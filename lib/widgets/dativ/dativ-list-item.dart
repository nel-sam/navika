import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/case-drop-down.dart';
import 'package:navika/widgets/shared/exercise-row-card.dart';

class DativListItem extends StatefulWidget {
  final DeclinableWord adjective;
  final DeclinableWord pronoun;
  final GenderEnum gender;
  final bool isPlural;
  final Noun noun;

  DativListItem(
      {required this.adjective,
      required this.isPlural,
      required this.pronoun,
      required this.gender,
      required this.noun});

  @override
  _DativListItemState createState() => _DativListItemState();
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

class _DativListItemState extends State<DativListItem> {
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
        widget.isPlural, CaseTypeEnum.Dativ, widget.noun.isAnimate);
    this.correctAdjValue = widget.adjective.getDeclension(widget.gender,
        widget.isPlural, CaseTypeEnum.Dativ, widget.noun.isAnimate);
    this.correctNounValue =
        widget.noun.getDeclension(widget.isPlural, CaseTypeEnum.Dativ);

    this.activeAdjValue = widget.adjective.dictionary;
    this.activePronounValue = widget.pronoun.dictionary;
    this.activeNounValue = widget.noun.dictionary;
  }

  String getSentenceStarter() {
    if (widget.noun.isAnimate) return 'Daj ';
    if (widget.isPlural) return 'Slični su ';
    return 'Slično je ';
  }

  bool checkAnswer() {
    return this.activePronounValue == this.correctPronounValue &&
        this.activeAdjValue == this.correctAdjValue &&
        this.activeNounValue == this.correctNounValue;
  }

  @override
  Widget build(BuildContext context) {
    var sentenceContent = [
      Text(getSentenceStarter()),
      CaseDropDown(
        activeValue: this.activePronounValue,
        correctValue: this.correctPronounValue,
        dropDownOptions: getDropdownItems(widget.pronoun),
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
        dropDownOptions: getDropdownItems(widget.adjective),
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
        dropDownOptions: getNounDropdownItems(widget.noun),
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
