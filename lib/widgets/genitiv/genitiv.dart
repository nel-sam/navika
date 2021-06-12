import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/genitiv/genitiv-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';

import '../../constants.dart';
import 'genitiv-list-item.dart';

class GenitivExerciseItem {
  DeclinableWord pronoun;
  GenderEnum gender;
  bool isPlural;
  Noun noun1;
  Noun noun2;

  GenitivExerciseItem(
      {required this.pronoun,
      required this.noun1,
      required this.gender,
      required this.isPlural,
      required this.noun2});
}

String getSentenceStarter(Noun noun, bool isPlural) {
  if (isPlural) return 'To su';
  return 'To je';
}

// ignore: must_be_immutable
class Genitiv extends StatefulWidget {
  var listItems = prepareData(wordBank);

  @override
  _GenitivState createState() => _GenitivState();
}

List<GenitivListItem> getListItems(List<GenitivExerciseItem> listItems) {
  return N.shuffleList(listItems)
      .map(
        (e) => GenitivListItem(
            sentenceStarter: getSentenceStarter(e.noun2, e.isPlural),
            correctPronounValue: e.pronoun.getDeclension(e.gender, e.isPlural,
                CaseTypeEnum.Nominativ, e.noun2.isAnimate),
            correctNoun1Value:
                e.noun1.getDeclension(e.isPlural, CaseTypeEnum.Nominativ),
            correctNoun2Value:
                e.noun2.getDeclension(e.isPlural, CaseTypeEnum.Genitiv),
            activePronounValue: e.pronoun.getRandomDeclension(),
            activeNoun1Value: e.noun1.getRandomDeclension(),
            activeNoun2Value: e.noun2.getRandomDeclension(),
            pronoun: e.pronoun,
            noun1: e.noun1,
            isPlural: e.isPlural,
            gender: e.gender,
            noun2: e.noun2),
      )
      .toList();
}

List<GenitivExerciseItem> prepareData(WordBank bank) {
  var listItems = List<GenitivExerciseItem>.empty(growable: true);

  bank.possesivePronouns.forEach((pp) {
    bank.nouns.forEach((noun1) {
      bank.nouns.forEach((noun2) {
        listItems.add(GenitivExerciseItem(
            pronoun: pp,
            noun1: noun1,
            gender: noun2.gender,
            isPlural: false,
            noun2: noun2));
        listItems.add(GenitivExerciseItem(
            pronoun: pp,
            noun1: noun1,
            gender: noun2.gender,
            isPlural: true,
            noun2: noun2));
      });
    });
  });

  return listItems;
}

class _GenitivState extends State<Genitiv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text('Genitiv'),
        actions: [
          Center(
            child: RefreshButton(
              refreshFunction: () => setState(() {
                widget.listItems = prepareData(wordBank);
              }),
            ),
          ),
          Center(
            child: ExplanationButton(popupWidget: GenitivExplanation()),
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
