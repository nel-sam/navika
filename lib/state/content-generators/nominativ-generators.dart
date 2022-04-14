import 'package:navika/lang_data/sentence_bank_generator.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/state/content-generators/pan-generator.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class NominativGenerators {
  static CaseQuestionState createExercise(
    List toAvoid,
    ExerciseTypes exerciseType,
    DialectType dialect,
  ) {
    PANCombo? c;
// TODO: generate exercises based on ExerciseType
    while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
      c = PanGenerator.getPANCombos(
        caseType: Cases.Nom,
        bank: SentenceBankGenerator(dialect: dialect)
            .sentences
            .excludePronoun('svoj'),
        getPersonalPronounSentenceStaticParts:
            getPersonalPronounSentenceStaticParts,
        getStaticSentenceParts: getStaticSentenceParts,
      );
    }

    return CaseQuestionState(combos: c);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
      PersonalPronoun personalPronoun, bool isShortForm) {
    String start = '';
    String end = '';
    final verb = N.getBitiConjugation(personalPronoun.nominativ.forms.first);

    if (Nrs.coinFlip()) {
      end = verb;
    } else {
      var ocupation = personalPronoun.gender == Genders.Feminine
          ? (personalPronoun.isPlural ? 'učiteljice' : 'učiteljica')
          : (personalPronoun.isPlural ? 'učitelji' : 'učitelj');
      end = '$verb $ocupation';
    }

    return StaticSentenceParts(start: start, end: end);
  }

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
}
