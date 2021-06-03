import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/shared/answer-status-icon.dart';

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

bool checkAnswer(DeclinableWord adjective, GenderEnum gender, bool isPlural,
    String? newValue) {
  return newValue ==
      adjective.getDeclension(gender, isPlural, CaseTypeEnum.Nominativ, false);
}

class _NominativListItemState extends State<NominativListItem> {
  bool isCorrect = false;
  bool showHint = false;
  late String activeValue;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    this.activeValue = widget.adjective.dictionary;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
        color: this.isCorrect ? CORRECT_COLOR : WRONG_COLOR,
      )),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnswerStatusIcon(isCorrect: this.isCorrect),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: Text('To je '),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                child: DropdownButton(
                  value: this.activeValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 1,
                    color: this.isCorrect ? CORRECT_COLOR : WRONG_COLOR,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      bool isCorrect = checkAnswer(widget.adjective,
                          widget.gender, widget.isPlural, newValue);

                      this.activeValue = newValue != null ? newValue : "";
                      this.isCorrect = isCorrect;
                    });
                  },
                  items: getAdjectiveDropdownItems(widget.adjective),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            ),
            Text(widget.isPlural
                ? widget.noun.nominativ.plural
                : widget.noun.nominativ.singular),
            Spacer(),
            this.showHint
                ? Row(children: [
                    Icon(WidgetHelpers.getGenderIcon(widget.gender)),
                    Icon(widget.isPlural ? PLURAL_ICON : SINGULAR_ICON),
                  ])
                : Spacer(),
            Spacer(),
            ElevatedButton(
                onPressed: () => {
                      setState(() {
                        this.showHint = !this.showHint;
                      })
                    },
                child: Icon(Icons.help)),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            ),
          ],
        ),
      ),
    );
  }
}
