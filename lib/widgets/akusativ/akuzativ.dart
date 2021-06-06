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
            child: ExplanationButton(popupWidget: AkuzativExplanation()),
          )
        ],
      ),
      body: isPortrait
          ? Center(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: getListItems(),
              ),
            )
          : Container(
              child: GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: getListItems(),
              ),
            ),
    );
  }
}
