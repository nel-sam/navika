import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/instrumental/instrumental-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';

import '../../constants.dart';
import 'instrumental-list-item.dart';

class InstrumentalExerciseItem {
  DeclinableWord pronoun;
  DeclinableWord adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  InstrumentalExerciseItem(
      {required this.pronoun,
      required this.adjective,
      required this.gender,
      required this.isPlural,
      required this.noun});
}

// ignore: must_be_immutable
class Instrumental extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = prepareData(wordBank);

  @override
  _InstrumentalState createState() => _InstrumentalState();
}

List<Widget> getListItems(List<InstrumentalExerciseItem> listItems) {
  return WidgetHelpers.shuffleList(listItems)
      .map(
        (e) => InstrumentalListItem(
            correctPronounValue: e.pronoun.getDeclension(e.gender, e.isPlural,
                CaseTypeEnum.Instrumental, e.noun.isAnimate),
            correctAdjValue: e.adjective.getDeclension(e.gender, e.isPlural,
                CaseTypeEnum.Instrumental, e.noun.isAnimate),
            correctNounValue:
                e.noun.getDeclension(e.isPlural, CaseTypeEnum.Instrumental),
            activePronounValue: e.pronoun.getRandomDeclension(),
            activeAdjValue: e.adjective.getRandomDeclension(),
            activeNounValue: e.noun.getRandomDeclension(),
            pronoun: e.pronoun,
            adjective: e.adjective,
            isPlural: e.isPlural,
            gender: e.gender,
            noun: e.noun),
      )
      .take(BATCH_COUNT)
      .toList();
}

List<InstrumentalExerciseItem> prepareData(WordBank bank) {
  List<InstrumentalExerciseItem> listItems =
      List<InstrumentalExerciseItem>.empty(growable: true);

  wordBank.possesivePronouns.forEach((pp) {
    wordBank.adjectives.forEach((adj) {
      wordBank.nouns.forEach((noun) {
        listItems.add(InstrumentalExerciseItem(
            pronoun: pp,
            adjective: adj,
            gender: noun.gender,
            isPlural: false,
            noun: noun));
        listItems.add(InstrumentalExerciseItem(
            pronoun: pp,
            adjective: adj,
            gender: noun.gender,
            isPlural: true,
            noun: noun));
      });
    });
  });

  return listItems;
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
            child: RefreshButton(
              refreshFunction: () => setState(() {
                widget.listItems = prepareData(wordBank);
              }),
            ),
          ),
          Center(
            child: ExplanationButton(popupWidget: InstrumentalExplanation()),
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: getListItems(widget.listItems),
        ),
      ),
    );
  }
}
