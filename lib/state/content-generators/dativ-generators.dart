import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';

class DativGenerators {
  static StaticSentenceParts getStaticSentenceParts(
      Noun noun, bool isPlural, Adjective? pronoun, Adjective? adjective) {
    String start = '';
    String end = '';

    if (noun.isAnimate) {
      start = 'Daj to ';
    } else if (isPlural) {
      start = 'Slični su ';
    } else {
      start = 'Slično je ';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun,
    bool isShortForm,
  ) {
    String start = '';
    String end = '';

    if (N.coinFlip()) {
      start = 'Danas';
      end = 'je rođendan';
    } else if (N.coinFlip()) {
      start = 'Pas je došlo do';
    } else if (N.coinFlip()) {
      start = 'Pas';
      end = 'je donio igračku';
    } else {
      start = 'On';
      end = 'nešto pokazao';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static CaseQuestionState createExercise(List toAvoid, Function? b) {
    PANCombo? c;

    while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
      c = N.getPANCombos(
        caseType: Cases.Dat,
        bank: wordBank,
        getPersonalPronounSentenceStaticParts:
            getPersonalPronounSentenceStaticParts,
        getStaticSentenceParts: getStaticSentenceParts,
      );
    }

    return CaseQuestionState(combos: c);
  }
}
