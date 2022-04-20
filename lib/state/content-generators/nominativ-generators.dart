import 'package:navika/lang_data/cases_exercises/nominativ_exercises.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class NominativGenerators {
  static CaseQuestionState createExercise(
    List toAvoid,
    ExerciseTypes exerciseType,
    DialectType dialect,
  ) {
    // TODO: Make sentences and all data static
    // TODO: generate exercises based on ExerciseType
    final PANCombo combo = NominativExercises(dialect).level1.first;

    return CaseQuestionState(combos: combo);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun,
    bool isShortForm,
    DialectType dialect,
  ) {
    String start = '';
    String end = '';
    final verb = N.getBitiConjugation(personalPronoun.nominativ.forms.first);

    if (Nrs.coinFlip()) {
      end = verb;
    } else {
      var occupation = personalPronoun.gender == Genders.Feminine
          ? (personalPronoun.isPlural ? 'učiteljice' : 'učiteljica')
          : (personalPronoun.isPlural ? 'učitelji' : 'učitelj');
      end = '$verb $occupation';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static StaticSentenceParts getStaticSentenceParts(
    Noun noun,
    bool isPlural,
    Adjective? pronoun,
    Adjective? adjective,
    DialectType dialect,
  ) {
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
