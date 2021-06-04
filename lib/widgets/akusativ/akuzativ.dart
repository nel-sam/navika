import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/akusativ/akuzativ-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';

import 'akuzativ-list-item.dart';

class AkusativExerciseItem {
  DeclinableWord possesivePronoun;
  DeclinableWord adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  AkusativExerciseItem(
      {required this.possesivePronoun,
      required this.adjective,
      required this.gender,
      required this.isPlural,
      required this.noun});
}

class Akuzativ extends StatefulWidget {
  final WordBank bank = wordBank;

  @override
  _AkuzativState createState() => _AkuzativState();
}

List<Widget> getListItems() {
  List<AkusativExerciseItem> listItems =
      List<AkusativExerciseItem>.empty(growable: true);

  wordBank.possesivePronouns.forEach((pp) {
    wordBank.adjectives.forEach((adj) {
      wordBank.nouns.forEach((noun) {
        listItems.add(AkusativExerciseItem(
            possesivePronoun: pp,
            adjective: adj,
            gender: noun.gender,
            isPlural: false,
            noun: noun));
        listItems.add(AkusativExerciseItem(
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
        (e) => AkuzativListItem(
            pronoun: e.possesivePronoun,
            adjective: e.adjective,
            isPlural: e.isPlural,
            gender: e.gender,
            noun: e.noun),
      )
      .toList();
}

class _AkuzativState extends State<Akuzativ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akuzativ'),
        actions: [
          Center(
            child: ExplanationButton(popupWidget: AkuzativExplanation()),
          )
        ],
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
