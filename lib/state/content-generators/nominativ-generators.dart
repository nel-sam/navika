import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';

class NominativGenerators {
  static StaticSentenceParts getStaticSentenceParts(
      Noun noun, bool isPlural, Adjective? pronoun, Adjective? adjective) {
    String start = '';
    String end = '';

    if (noun.isAnimate) {
      switch (noun.gender) {
        case Genders.Masculine:
          start = isPlural ? 'Oni su' : 'On je';
          break;
        case Genders.Feminine:
          start = isPlural ? 'One su' : 'Ona je';
          break;
        case Genders.Unspecific:
        case Genders.Neuter:
          break;
      }
    } else {
      start = isPlural ? 'To su' : 'To je';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
      PersonalPronoun personalPronoun, bool isShortForm) {
    String start = '';
    String end = '';
    final verb = N.getBitiConjugation(personalPronoun.nominativ.forms.first);

    if (N.coinFlip()) {
      end = verb;
    } else {
      var ocupation = personalPronoun.gender == Genders.Feminine
          ? (personalPronoun.isPlural ? 'učiteljice' : 'učiteljica')
          : (personalPronoun.isPlural ? 'učitelji' : 'učitelj');
      end = '$verb $ocupation';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static CaseQuestionState createExercise(List toAvoid) {
    PANCombo? c;

    while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
      c = N.getPANCombos(
        caseType: Cases.Nom,
        bank: wordBank.excludePronoun('svoj'),
        getPersonalPronounSentenceStaticParts:
            getPersonalPronounSentenceStaticParts,
        getStaticSentenceParts: getStaticSentenceParts,
      );
    }

    return CaseQuestionState(combos: c);
  }
}
