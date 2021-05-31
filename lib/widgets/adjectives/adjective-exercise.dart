import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdjectiveNounPair {
  String activeValue;
  Adjective adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  AdjectiveNounPair(
      {required this.activeValue,
      required this.adjective,
      required this.gender,
      required this.isPlural,
      required this.noun});
}

class AdjectivesExercise extends StatefulWidget {
  final WordBank bank = wordBank;

  @override
  _AdjectivesExerciseState createState() => _AdjectivesExerciseState();
}

class _AdjectivesExerciseState extends State<AdjectivesExercise> {
  List<Widget> getListItems() {
    List<AdjectiveNounPair> listItems =
        List<AdjectiveNounPair>.empty(growable: true);

    widget.bank.adjectives.forEach((adj) {
      widget.bank.nouns.forEach((noun) {
        listItems.add(AdjectiveNounPair(
            activeValue: adj.dictionary,
            adjective: adj,
            noun: noun,
            isPlural: false,
            gender: noun.gender));
        listItems.add(AdjectiveNounPair(
            activeValue: adj.dictionary,
            adjective: adj,
            noun: noun,
            isPlural: true,
            gender: noun.gender));
      });
    });

    List<DropdownMenuItem<String>> getAdjectiveDropdownItems(
        AdjectiveNounPair e) {
      final adj = e.adjective;
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

    return listItems
        .map(
          (e) => new Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('To je '),
                DropdownButton(
                  value: e.activeValue,
                  hint: Text(e.adjective.dictionary),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      bool isCorrect = checkAnswer(e, newValue);

                      if (isCorrect) {
                        AlertDialog(content: Text("NO!"));
                      }
                    });
                  },
                  items: getAdjectiveDropdownItems(e),
                ),
                Text(e.isPlural
                    ? e.noun.nomativ.plural
                    : e.noun.nomativ.singular),
              ],
            ),
          ),
        )
        .toList();
  }

  bool checkAnswer(AdjectiveNounPair e, String? newValue) {
    var correctValue = "";

    if (e.gender == GenderEnum.Masculine) {
      correctValue = e.isPlural
          ? e.adjective.nomativ.masculine.plural
          : e.adjective.nomativ.masculine.singular;
    } else if (e.gender == GenderEnum.Feminine) {
      correctValue = e.isPlural
          ? e.adjective.nomativ.feminine.plural
          : e.adjective.nomativ.feminine.singular;
    } else {
      correctValue = e.isPlural
          ? e.adjective.nomativ.neuter.plural
          : e.adjective.nomativ.neuter.singular;
    }

    var isCorrect = newValue == correctValue;
    return isCorrect;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.adjectives),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: getListItems(),
        ),
      ),
    );
  }
}
