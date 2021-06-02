import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';

import 'dativ-list-item.dart';

class DativExerciseItem {
  DeclinableWord possesivePronoun;
  DeclinableWord adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  DativExerciseItem(
      {required this.possesivePronoun,
      required this.adjective,
      required this.gender,
      required this.isPlural,
      required this.noun});
}

class Dativ extends StatefulWidget {
  final WordBank bank = wordBank;

  @override
  _DativState createState() => _DativState();
}

List<Widget> getListItems() {
  List<DativExerciseItem> listItems = List<DativExerciseItem>.empty(growable: true);

  wordBank.possesivePronouns.forEach((pp) {
    wordBank.adjectives.forEach((adj) {
      wordBank.nouns.forEach((noun) {
        listItems.add(DativExerciseItem(
            possesivePronoun: pp,
            adjective: adj,
            gender: noun.gender,
            isPlural: false,
            noun: noun));
        listItems.add(DativExerciseItem(
            possesivePronoun: pp,
            adjective: adj,
            gender: noun.gender,
            isPlural: true,
            noun: noun));
      });
    });
  });

  return WidgetHelpers.shuffleList(listItems)
      .map(
        (e) => DativListItem(
            pronoun: e.possesivePronoun,
            adjective: e.adjective,
            isPlural: e.isPlural,
            gender: e.gender,
            noun: e.noun),
      )
      .toList();
}

class _DativState extends State<Dativ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dativ'),
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
