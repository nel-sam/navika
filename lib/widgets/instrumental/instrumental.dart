import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/instrumental/instrumental-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';

import 'instrumental-list-item.dart';

class InstrumentalExerciseItem {
  DeclinableWord possesivePronoun;
  DeclinableWord adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  InstrumentalExerciseItem(
      {required this.possesivePronoun,
      required this.adjective,
      required this.gender,
      required this.isPlural,
      required this.noun});
}

class Instrumental extends StatefulWidget {
  final WordBank bank = wordBank;

  @override
  _InstrumentalState createState() => _InstrumentalState();
}

List<Widget> getListItems() {
  List<InstrumentalExerciseItem> listItems =
      List<InstrumentalExerciseItem>.empty(growable: true);

  wordBank.possesivePronouns.forEach((pp) {
    wordBank.adjectives.forEach((adj) {
      wordBank.nouns.forEach((noun) {
        listItems.add(InstrumentalExerciseItem(
            possesivePronoun: pp,
            adjective: adj,
            gender: noun.gender,
            isPlural: false,
            noun: noun));
        listItems.add(InstrumentalExerciseItem(
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
        (e) => InstrumentalListItem(
            pronoun: e.possesivePronoun,
            adjective: e.adjective,
            isPlural: e.isPlural,
            gender: e.gender,
            noun: e.noun),
      )
      .toList();
}

class _InstrumentalState extends State<Instrumental> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Instrumental'),
        actions: [
          Center(
            child: ExplanationButton(popupWidget: InstrumentalExplanation()),
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
