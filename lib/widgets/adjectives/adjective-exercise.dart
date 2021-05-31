import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/adjectives/adjective-list-item.dart';

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

    return listItems
        .map(
          (e) => AdjectiveListItem(
              activeValue: e.activeValue,
              adjective: e.adjective,
              isPlural: e.isPlural,
              gender: e.gender,
              noun: e.noun),
        )
        .toList();
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
