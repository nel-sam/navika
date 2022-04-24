import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state.dart';

class InstrumentalGenerators {
  static List<CaseQuestionState> createExercise(
    ExerciseTypes exerciseType,
    DialectType dialect,
    bool isPremium,
  ) {
    // final SentenceBank bank =
    //     SentenceBankGenerator(dialect: dialect).sentencesBankData.excludeNounsByTags([
    //   Tags.Location,
    //   Tags.Health,
    // ]);

    PANCombo? c;

    // while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
    //   c = PanGenerator.getPANCombos(
    //     caseType: Cases.Ins,
    //     bank: bank,
    //     dialect: dialect,
    //     getPersonalPronounSentenceStaticParts:
    //         getPersonalPronounSentenceStaticParts,
    //     getStaticSentenceParts: getStaticSentenceParts,
    //   );
    // }

    return [CaseQuestionState(combos: c!)];
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun,
    bool isShortForm,
    DialectType dialect,
  ) {
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
}
