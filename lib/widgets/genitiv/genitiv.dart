import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/genitiv/genitiv-list-item.dart';
import 'package:navika/widgets/shared/footer.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';

class GenitivExerciseItem {
  Adjective pronoun;
  Genders gender;
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

StaticSentenceParts getStaticSentenceStarter(
    Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';
  if (isPlural) {
    start = 'To su';
  } else {
    start = 'To je';
  }

  return StaticSentenceParts(start: start, end: '');
}

// ignore: must_be_immutable
class Genitiv extends StatefulWidget {
  var listItems = prepareData(wordBank);

  @override
  _GenitivState createState() => _GenitivState();
}

List<GenitivListItem> getListItems(List<GenitivExerciseItem> listItems) {
  return N.shuffleList(listItems).map((GenitivExerciseItem e) {
    final correctPronounValue = e.pronoun.getDeclension(
        e.gender, e.isPlural, CaseTypeEnum.Nominativ, e.noun2.isAnimate);
    final correctNoun1Value =
        e.noun1.getDeclension(e.isPlural, CaseTypeEnum.Nominativ);
    final correctNoun2Value =
        e.noun2.getDeclension(e.isPlural, CaseTypeEnum.Genitiv);

    final staticParts =
        getStaticSentenceStarter(e.noun2, e.isPlural, e.pronoun);

    return GenitivListItem(
        sentenceStarter: staticParts.start,
        sentenceEnder: staticParts.end,
        correctPronounValue: correctPronounValue,
        correctNoun1Value: correctNoun1Value,
        correctNoun2Value: correctNoun2Value,
        activePronounValue: e.pronoun.getRandomDeclension(correctPronounValue),
        activeNoun1Value: e.noun1.getRandomDeclension(correctNoun1Value),
        activeNoun2Value: e.noun2.getRandomDeclension(correctNoun2Value),
        pronoun: e.pronoun,
        noun1: e.noun1,
        isPlural: e.isPlural,
        gender: e.gender,
        noun2: e.noun2);
  }).toList();
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

        if (noun1.nominativ.plural != '' && noun2.nominativ.plural != '') {
          listItems.add(GenitivExerciseItem(
              pronoun: pp,
              noun1: noun1,
              gender: noun2.gender,
              isPlural: true,
              noun2: noun2));
        }
      });
    });
  });

  return listItems;
}

class _GenitivState extends State<Genitiv> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text('Genitiv'),
      ),
      body: Center(
        child: ListView(
          controller: controller,
          padding: EXERCISE_LIST_PADDING,
          children: [
            NavikaBanner(
                imagePath: CaseImagePaths[CaseTypeEnum.Genitiv]!,
                caseName: 'Genitiv',
                description: AppLocalizations.of(context)!.genitiveDescription,
                icons: [
                  Icons.coffee,
                ]),
            ...getListItems(widget.listItems),
          ],
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Genitiv,
        refreshFunction: () => setState(() {
          widget.listItems = prepareData(wordBank);
          N.scrollTo(0, controller);
        }),
      ),
    );
  }
}
