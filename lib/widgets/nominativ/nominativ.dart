import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/nominativ/nominativ-list-item.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';
import '../../constants.dart';
import 'nominativ-explanation.dart';

class NominativExerciseItem {
  String activeAdjValue;
  String activeNounValue;
  DeclinableWord adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  NominativExerciseItem(
      {required this.activeAdjValue,
      required this.activeNounValue,
      required this.adjective,
      required this.gender,
      required this.isPlural,
      required this.noun});
}

List<NominativExerciseItem> prepareData(WordBank bank) {
  List<NominativExerciseItem> listItems =
      List<NominativExerciseItem>.empty(growable: true);

  bank.adjectives.forEach((adj) {
    bank.nouns.forEach((noun) {
      listItems.add(NominativExerciseItem(
          activeAdjValue: adj.getRandomDeclension(),
          activeNounValue: noun.getRandomDeclension(),
          adjective: adj,
          noun: noun,
          isPlural: false,
          gender: noun.gender));
      listItems.add(NominativExerciseItem(
          activeAdjValue: adj.getRandomDeclension(),
          activeNounValue: noun.getRandomDeclension(),
          adjective: adj,
          noun: noun,
          isPlural: true,
          gender: noun.gender));
    });
  });

  bank.possesivePronouns.forEach((pp) {
    bank.nouns.forEach((noun) {
      listItems.add(NominativExerciseItem(
          activeAdjValue: pp.getRandomDeclension(),
          activeNounValue: noun.getRandomDeclension(),
          adjective: pp,
          noun: noun,
          isPlural: false,
          gender: noun.gender));
      listItems.add(NominativExerciseItem(
          activeAdjValue: pp.getRandomDeclension(),
          activeNounValue: noun.getRandomDeclension(),
          adjective: pp,
          noun: noun,
          isPlural: true,
          gender: noun.gender));
    });
  });
  
  return listItems;
}

List<Widget> getListItems(List<NominativExerciseItem> listItems) {
  return WidgetHelpers.shuffleList(listItems)
      .map(
        (e) => NominativListItem(
            correctAdjValue: e.adjective.getDeclension(
                e.gender, e.isPlural, CaseTypeEnum.Nominativ, e.noun.isAnimate),
            correctNounValue:
                e.noun.getDeclension(e.isPlural, CaseTypeEnum.Nominativ),
            activeNounValue: e.activeNounValue,
            activeAdjValue: e.activeAdjValue,
            adjective: e.adjective,
            isPlural: e.isPlural,
            gender: e.gender,
            noun: e.noun),
      )
      .take(BATCH_COUNT)
      .toList();
}

// ignore: must_be_immutable
class NominativExercise extends StatefulWidget {
  var listItems = prepareData(wordBank);

  @override
  _NominativExerciseState createState() => _NominativExerciseState();
}

class _NominativExerciseState extends State<NominativExercise> {
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
            child: RefreshButton(
              refreshFunction: () => setState(() {
                widget.listItems = prepareData(wordBank);
              }),
            ),
          ),
          Center(
            child: ExplanationButton(popupWidget: NominativExplanation()),
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
