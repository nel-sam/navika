import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/akusativ/akuzativ-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';

import '../../constants.dart';
import 'akuzativ-list-item.dart';

class AkusativExerciseItem {
  DeclinableWord pronoun;
  DeclinableWord adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  AkusativExerciseItem(
      {required this.pronoun,
      required this.adjective,
      required this.gender,
      required this.isPlural,
      required this.noun});
}

List<Widget> getListItems(List<AkusativExerciseItem> listItems) {
  return WidgetHelpers.shuffleList(listItems)
      .map(
        (e) => AkuzativListItem(
            correctPronounValue: e.pronoun.getDeclension(
                e.gender, e.isPlural, CaseTypeEnum.Akuzativ, e.noun.isAnimate),
            correctAdjValue: e.adjective.getDeclension(
                e.gender, e.isPlural, CaseTypeEnum.Akuzativ, e.noun.isAnimate),
            correctNounValue:
                e.noun.getDeclension(e.isPlural, CaseTypeEnum.Akuzativ),
            adjective: e.adjective,
            activePronounValue: e.pronoun.getRandomDeclension(),
            activeAdjValue: e.adjective.getRandomDeclension(),
            activeNounValue: e.noun.getRandomDeclension(),
            isPlural: e.isPlural,
            pronoun: e.pronoun,
            gender: e.gender,
            noun: e.noun),
      )
      .take(BATCH_COUNT)
      .toList();
}

List<AkusativExerciseItem> prepareData(WordBank bank) {
  List<AkusativExerciseItem> listItems =
      List<AkusativExerciseItem>.empty(growable: true);

  bank.possesivePronouns.forEach((pp) {
    bank.adjectives.forEach((adj) {
      bank.nouns.forEach((noun) {
        listItems.add(AkusativExerciseItem(
            pronoun: pp,
            adjective: adj,
            gender: noun.gender,
            isPlural: false,
            noun: noun));
        listItems.add(AkusativExerciseItem(
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

// ignore: must_be_immutable
class Akuzativ extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = prepareData(wordBank);

  @override
  _AkuzativState createState() => _AkuzativState();
}

class _AkuzativState extends State<Akuzativ> {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Akuzativ'),
        actions: [
          Center(
            child: RefreshButton(
              refreshFunction: () => setState(() {
                widget.listItems = prepareData(wordBank);
              }),
            ),
          ),
          Center(
            child: ExplanationButton(popupWidget: AkuzativExplanation()),
          )
        ],
      ),
      body: isPortrait
          ? Center(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: getListItems(widget.listItems),
              ),
            )
          : Container(
              child: GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: getListItems(widget.listItems),
              ),
            ),
    );
  }
}
