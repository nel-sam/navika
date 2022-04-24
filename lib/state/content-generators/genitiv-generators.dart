import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/cases/case-question-state.dart';

class GenitivGenerators {
  static List<CaseQuestionState> createExercise(
    ExerciseTypes exerciseType,
    DialectType dialect,
    bool isPremium,
  ) {
    PANCombo? c;

    // while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
    //   c = PanGenerator.getPANCombos(
    //     caseType: Cases.Gen,
    //     dialect: dialect,
    //     bank: SentenceBankGenerator(dialect: dialect).sentencesBankData,
    //     getPersonalPronounSentenceStaticParts:
    //         getPersonalPronounSentenceStaticParts,
    //     getStaticSentenceParts: getStaticSentenceParts,
    //   );
    // }

    return [CaseQuestionState(combos: c!)];
  }
}
