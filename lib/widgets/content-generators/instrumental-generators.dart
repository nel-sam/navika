import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter/material.dart';

class InstrumentalGenerators {
  static StaticSentenceParts getStaticSentenceParts(
    Noun noun,
    bool isPlural,
    Adjective? pronoun,
    Adjective? adjective,
  ) {
    String start = '';
    String end = '';
    String possPronouns = pronoun!.nominativ.masculine.singular.first;
    String sSa = getsSa(
      noun,
      pronoun,
      adjective,
    );

    if (noun.tags.contains(Tags.BodyPart)) {
      start =
          possPronouns == 'moj' ? 'Ovo ti dobro ide s' : 'Ovo mi dobro ide s';
    } else if (noun.tags.contains(Tags.Vehicle)) {
      start = possPronouns == 'moj' ? 'Putujemo' : 'Putujem';
    } else if (noun.tags.contains(Tags.Human) ||
        noun.tags.contains(Tags.Portable)) {
      if (possPronouns != 'tvoj')
        start = N.coinFlip() ? 'Ti ideš $sSa' : 'Trebaš da ideš $sSa';
      else
        start = 'Idemo $sSa';
    } else if (noun.tags.contains(Tags.Health)) {
      start = possPronouns == 'moj' ? 'Putovao je $sSa' : 'Putovao sam $sSa';
    } else if (noun.tags.contains(Tags.Location)) {
      start = '';
    } else if (possPronouns == 'moj')
      start = 'Ideš $sSa';
    else
      start = 'Idem $sSa';

    return StaticSentenceParts(start: start, end: end);
  }

  static String getsSa(Noun noun, Adjective? pronoun, Adjective? adjective) {
    const saLetters = 'sšzž';

    if (pronoun != null &&
        saLetters.contains(pronoun.dictionary.characters.first)) {
      return 'sa';
    } else if (pronoun != null) {
      return 's';
    } else if (adjective != null && saLetters.contains(adjective.dictionary)) {
      return 'sa';
    } else if (adjective != null) {
      return 's';
    } else if (saLetters.contains(noun.dictionary.characters.first)) {
      return 'sa';
    }

    return 's';
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
      PersonalPronoun personalPronoun, bool isShortForm) {
    final actualValue = personalPronoun.nominativ.forms.first;
    String start = '';
    String end = '';

    if (actualValue != 'ja') {
      start = 'Ja ću pjevati s';
    } else {
      start = 'On će ići s';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static List<QuestionStateItem> initializePANStateItems() {
    final WordBank bank = wordBank.excludeNounsByTags([
      Tags.Location,
      Tags.Health,
    ]);

    final combos = N.getPANCombos(
      caseType: Cases.Nom,
      bank: bank,
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      getStaticSentenceParts: getStaticSentenceParts,
    );

    final result = combos.map((c) {
      return QuestionStateItem(combos: c);
    });

    return result.toList();
  }
}
