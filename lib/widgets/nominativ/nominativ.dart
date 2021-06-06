import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/nominativ/nominativ-list-item.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'nominativ-explanation.dart';

class NominativExerciseItem {
  String activeValue;
  DeclinableWord adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  NominativExerciseItem(
      {required this.activeValue,
      required this.adjective,
      required this.gender,
      required this.isPlural,
      required this.noun});
}

class NominativExercise extends StatefulWidget {
  final WordBank bank = wordBank;

  @override
  _NominativExerciseState createState() => _NominativExerciseState();
}

class _NominativExerciseState extends State<NominativExercise> {
  List<Widget> getListItems() {
    List<NominativExerciseItem> listItems =
        List<NominativExerciseItem>.empty(growable: true);

    widget.bank.adjectives.forEach((adj) {
      widget.bank.nouns.forEach((noun) {
        listItems.add(NominativExerciseItem(
            activeValue: adj.getRandomDeclension(),
            adjective: adj,
            noun: noun,
            isPlural: false,
            gender: noun.gender));
        listItems.add(NominativExerciseItem(
            activeValue: adj.getRandomDeclension(),
            adjective: adj,
            noun: noun,
            isPlural: true,
            gender: noun.gender));
      });
    });

    widget.bank.possesivePronouns.forEach((pp) {
      widget.bank.nouns.forEach((noun) {
        listItems.add(NominativExerciseItem(
            activeValue: pp.getRandomDeclension(),
            adjective: pp,
            noun: noun,
            isPlural: false,
            gender: noun.gender));
        listItems.add(NominativExerciseItem(
            activeValue: pp.getRandomDeclension(),
            adjective: pp,
            noun: noun,
            isPlural: true,
            gender: noun.gender));
      });
    });

    return WidgetHelpers.shuffleList(listItems)
        .map(
          (e) => NominativListItem(
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
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Nominativ'),
        actions: [
          Center(
            child: ExplanationButton(popupWidget: NominativExplanation()),
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
