import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
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

List<DropdownMenuItem<String>> getAdjectiveDropdownItems(DeclinableWord adj) {
  return adj
      .getUniqueDeclensions()
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();
}

class _NominativListItemState extends State<NominativListItem> {
  bool isAllCorrect = false;
  bool showHint = false;
  late String activeAdjValue;
  late String correctAdjValue;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    this.correctAdjValue = widget.adjective.getDeclension(widget.gender,
        widget.isPlural, CaseTypeEnum.Nominativ, widget.noun.isAnimate);

    this.activeAdjValue = widget.adjective.dictionary;
  }

  bool checkAnswer() {
    return this.activeAdjValue == this.correctAdjValue;
  }

  @override
  Widget build(BuildContext context) {
    var sentenceContent = [
      Text('To je '),
      CaseDropDown(
        activeValue: this.activeAdjValue,
        correctValue: this.correctAdjValue,
        dropDownOptions: getAdjectiveDropdownItems(widget.adjective),
        onChanged: (String newVal) {
          setState(() {
            this.activeAdjValue = newVal;
            this.isAllCorrect = checkAnswer();
          });
        },
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(widget.isPlural
            ? widget.noun.nominativ.plural
            : widget.noun.nominativ.singular),
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
