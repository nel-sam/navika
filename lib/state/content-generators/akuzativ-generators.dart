import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';

class AkuzativGenerators {
  static StaticSentenceParts getStaticSentenceParts(
      Noun noun, bool isPlural, Adjective? pronoun, Adjective? adjective) {
    String start = '';
    String end = '';
    final pron = pronoun != null ? pronoun.nominativ.masculine.singular : '';

    if (noun.tags.contains(Tags.Season)) {
      start = N.coinFlip() ? 'Volim' : 'Ne volim';
    } else if (noun.tags.contains(Tags.Location)) {
      start = 'Idemo u';
    } else if (noun.tags.contains(Tags.Food)) {
      start = N.coinFlip() ? 'Ću jesti' : 'Želi';
    } else if (pron != 'moj')
      start = N.coinFlip() ? 'Ja vidim' : 'Volim';
    else if (noun.tags.contains(Tags.Portable)) {
      start = 'Daj joj';
    } else {
      start = 'Vidimo';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun,
    bool isShortForm,
  ) {
    final actualValue = personalPronoun.nominativ.forms.first;
    String start = '';
    String end = '';

    if (actualValue != 'mi' && N.coinFlip()) {
      start = 'Vidimo';
    } else if (actualValue != 'ti' && N.coinFlip()) {
      start = 'Daj to ';
    } else if (isShortForm) {
      start = 'Molim';
    } else {
      start = actualValue != 'ti' ? 'Videš' : 'Videm';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static CaseQuestionState createExercise(List toAvoid) {
    PANCombo? c;

    while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
      c = N.getPANCombos(
        caseType: Cases.Aku,
        bank: wordBank,
        getPersonalPronounSentenceStaticParts:
            getPersonalPronounSentenceStaticParts,
        getStaticSentenceParts: getStaticSentenceParts,
      );
    }

    return CaseQuestionState(combos: c);
  }
}
