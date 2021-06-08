import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/genitiv/genitiv-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';

import 'genitiv-list-item.dart';

class GenitivExerciseItem {
  DeclinableWord possesivePronoun;
  GenderEnum gender;
  bool isPlural;
  Noun noun1;
  Noun noun2;

  GenitivExerciseItem(
      {required this.possesivePronoun,
      required this.noun1,
      required this.gender,
      required this.isPlural,
      required this.noun2});
}

class Genitiv extends StatefulWidget {
  final WordBank bank = wordBank;

  @override
  _GenitivState createState() => _GenitivState();
}

List<Widget> getListItems() {
  List<GenitivExerciseItem> listItems =
      List<GenitivExerciseItem>.empty(growable: true);

  wordBank.possesivePronouns.forEach((pp) {
    wordBank.nouns.forEach((noun1) {
      wordBank.nouns.forEach((noun2) {
        listItems.add(GenitivExerciseItem(
            possesivePronoun: pp,
            noun1: noun1,
            gender: noun2.gender,
            isPlural: false,
            noun2: noun2));
        listItems.add(GenitivExerciseItem(
            possesivePronoun: pp,
            noun1: noun1,
            gender: noun2.gender,
            isPlural: true,
            noun2: noun2));
      });
    });
  });

  return WidgetHelpers.shuffleList(listItems)
      .map(
        (e) => GenitivListItem(
            pronoun: e.pronoun,
            noun1: e.noun1,
            isPlural: e.isPlural,
            gender: e.gender,
            noun2: e.noun2),
      )
      .toList();
}

class _GenitivState extends State<Genitiv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Genitiv'),
        actions: [
          Center(
            child: ExplanationButton(popupWidget: GenitivExplanation()),
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
