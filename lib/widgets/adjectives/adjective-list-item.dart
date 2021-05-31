import 'package:flutter/material.dart';
import 'package:navika/models/models.dart';

class AdjectiveListItem extends StatefulWidget {
  Adjective adjective;
  String activeValue;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  bool isCorrect = false;

  AdjectiveListItem(
      {required this.activeValue,
      required this.adjective,
      required this.isPlural,
      required this.gender,
      required this.noun});

  @override
  _AdjectiveListItemState createState() => _AdjectiveListItemState();
}

List<DropdownMenuItem<String>> getAdjectiveDropdownItems(Adjective adj) {
  final options = [
    adj.dictionary,
    adj.nomativ.masculine.singular,
    adj.nomativ.feminine.singular,
    adj.nomativ.neuter.singular,
    adj.akusativ.masculine.singular,
    adj.akusativ.feminine.singular,
    adj.akusativ.neuter.singular,
    adj.akusativAnimate.masculine.singular,
    adj.akusativAnimate.feminine.singular,
    adj.akusativAnimate.neuter.singular,
    adj.instrumental.masculine.singular,
    adj.instrumental.feminine.singular,
    adj.instrumental.neuter.singular,
    adj.lokativ.masculine.singular,
    adj.lokativ.feminine.singular,
    adj.lokativ.neuter.singular,
    adj.dativ.masculine.singular,
    adj.dativ.feminine.singular,
    adj.dativ.neuter.singular,
    adj.genitiv.masculine.singular,
    adj.genitiv.feminine.singular,
    adj.genitiv.neuter.singular,
    adj.vokativ.masculine.singular,
    adj.vokativ.feminine.singular,
    adj.vokativ.neuter.singular,
    adj.nomativ.masculine.plural,
    adj.nomativ.feminine.plural,
    adj.nomativ.neuter.plural,
    adj.akusativ.masculine.plural,
    adj.akusativ.feminine.plural,
    adj.akusativ.neuter.plural,
    adj.akusativAnimate.masculine.plural,
    adj.akusativAnimate.feminine.plural,
    adj.akusativAnimate.neuter.plural,
    adj.instrumental.masculine.plural,
    adj.instrumental.feminine.plural,
    adj.instrumental.neuter.plural,
    adj.lokativ.masculine.plural,
    adj.lokativ.feminine.plural,
    adj.lokativ.neuter.plural,
    adj.dativ.masculine.plural,
    adj.dativ.feminine.plural,
    adj.dativ.neuter.plural,
    adj.genitiv.masculine.plural,
    adj.genitiv.feminine.plural,
    adj.genitiv.neuter.plural,
    adj.vokativ.masculine.plural,
    adj.vokativ.feminine.plural,
    adj.vokativ.neuter.plural,
  ].toSet().toList().where((element) => element.length > 0);

  return options
      .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
      .toList();
}

bool checkAnswer(
    Adjective adjective, GenderEnum gender, bool isPlural, String? newValue) {
  var correctValue = "";

  if (gender == GenderEnum.Masculine) {
    correctValue = isPlural
        ? adjective.nomativ.masculine.plural
        : adjective.nomativ.masculine.singular;
  } else if (gender == GenderEnum.Feminine) {
    correctValue = isPlural
        ? adjective.nomativ.feminine.plural
        : adjective.nomativ.feminine.singular;
  } else {
    correctValue = isPlural
        ? adjective.nomativ.neuter.plural
        : adjective.nomativ.neuter.singular;
  }

  var isCorrect = newValue == correctValue;
  return isCorrect;
}

class _AdjectiveListItemState extends State<AdjectiveListItem> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('To je '),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: DropdownButton(
                value: widget.activeValue,
                hint: Text(widget.activeValue),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: widget.isCorrect ? Colors.blueGrey : Colors.red,
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
            Text(widget.isPlural
                ? widget.noun.nomativ.plural
                : widget.noun.nomativ.singular),
          ],
        ),
      ),
    );
  }
}
