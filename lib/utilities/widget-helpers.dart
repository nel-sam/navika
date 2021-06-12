import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/shared/pan-list-item.dart';

class WidgetHelpers {
  static IconData getGenderIcon(GenderEnum gender) {
    if (gender == GenderEnum.Feminine) {
      return FEMINIE_ICON;
    } else if (gender == GenderEnum.Masculine) {
      return MASCULINE_ICON;
    } else {
      return NEUTER_ICON;
    }
  }

  static List shuffleList(List items) {
    var random = new Random();

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  static List<DropdownMenuItem<String>> getNounDropdownItems(Noun noun) {
    var items = noun.getUniqueDeclensions();
    return items
        .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
        .toList();
  }

  static List<DropdownMenuItem<String>> getDropdownItems(DeclinableWord word) {
    var items = word.getUniqueDeclensions();
    return items
        .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
        .toList();
  }

  static bool isDarkTheme(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static TextTheme getAppBarTextTheme(BuildContext context) {
    return isDarkTheme(context)
        ? APP_BAR_TEXTTHEME_DARK
        : APP_BAR_TEXTTHEME_LIGHT;
  }

  static IconThemeData getAppBarIconTheme(BuildContext context) {
    return isDarkTheme(context)
        ? APP_BAR_ICONTHEME_DARK
        : APP_BAR_ICONTHEME_LIGHT;
  }

  static Color getAppBarColor(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return darkModeOn ? const Color(0xFF212121) : Colors.white;
  }

  static List<PANExerciseItem> getPANCombos(
      WordBank bank, Function getSentenceStarters) {
    var listItems = List<PANExerciseItem>.empty(growable: true);

    bank.possesivePronouns.forEach((pp) {
      bank.adjectives.forEach((adj) {
        bank.nouns.forEach((noun) {
          listItems.add(PANExerciseItem(
              sentenceStarter: getSentenceStarters(noun, false),
              pronoun: pp,
              adjective: adj,
              gender: noun.gender,
              isPlural: false,
              noun: noun));
          listItems.add(PANExerciseItem(
              sentenceStarter: getSentenceStarters(noun, true),
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

  static List<PANListItem> getPANListItems(
      List<PANExerciseItem> listItems, CaseTypeEnum caseType) {
    return WidgetHelpers.shuffleList(listItems)
        .map(
          (e) => PANListItem(
              sentenceStarter: e.sentenceStarter,
              correctPronounValue: e.pronoun.getDeclension(
                  e.gender, e.isPlural, caseType, e.noun.isAnimate),
              correctAdjValue: e.adjective.getDeclension(
                  e.gender, e.isPlural, caseType, e.noun.isAnimate),
              correctNounValue: e.noun.getDeclension(e.isPlural, caseType),
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

  static getRandomTense() {
    final tenses = TenseEnum.values;
    var index = (new Random()).nextInt(tenses.length - 1);
    return tenses[index];
  }
}
