import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';

class AdjectiveListItem extends StatefulWidget {
  DeclinableWord adjective;
  String activeValue;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  bool isCorrect = false;
  bool showHint = false;

  AdjectiveListItem(
      {required this.activeValue,
      required this.adjective,
      required this.isPlural,
      required this.gender,
      required this.noun});

  @override
  _AdjectiveListItemState createState() => _AdjectiveListItemState();
}

List<DropdownMenuItem<String>> getAdjectiveDropdownItems(DeclinableWord adj) {
  return adj.getUniqueDeclensions()
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();
}

bool checkAnswer(DeclinableWord adjective, GenderEnum gender, bool isPlural,
    String? newValue) {
  return newValue ==
      adjective.getDeclension(gender, isPlural, CaseTypeEnum.Nominativ, false);
}

class _AdjectiveListItemState extends State<AdjectiveListItem> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
        color: widget.isCorrect ? CORRECT_COLOR : WRONG_COLOR,
      )),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
            ),
            Text('To je '),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            ),
            Container(
              child: DropdownButton(
                value: widget.activeValue,
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 1,
                  color: widget.isCorrect ? CORRECT_COLOR : WRONG_COLOR,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    bool isCorrect = checkAnswer(widget.adjective,
                        widget.gender, widget.isPlural, newValue);

                    widget.activeValue = newValue != null ? newValue : "";
                    widget.isCorrect = isCorrect;
                  });
                },
                items: getAdjectiveDropdownItems(widget.adjective),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            ),
            Text(widget.isPlural
                ? widget.noun.nominativ.plural
                : widget.noun.nominativ.singular),
            Spacer(),
            widget.showHint
                ? Row(children: [
                    Icon(WidgetHelpers.getGenderIcon(widget.gender)),
                    Text(widget.isPlural ? '2+' : '1'),
                  ])
                : Spacer(),
            Spacer(),
            ElevatedButton(
                onPressed: () => {
                      setState(() {
                        widget.showHint = !widget.showHint;
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
