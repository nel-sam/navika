import 'package:navika/extensions.dart';
import 'package:navika/lang_data/cases_exercises/genitiv_exercises.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class GenitivGenerators {
  static List<CaseQuestionState> createExercise(
    ExerciseTypes exerciseType,
    DialectType dialect,
    bool isPremium,
  ) {
    List<PANCombo> combos = [];

    if (exerciseType == ExerciseTypes.case_personal_pronouns) {
      combos.addAll(GenitivExercises(dialect).personalPronouns);
    } else if (isPremium) {
      combos.addAll(GenitivExercises(dialect).premium);
    }

    if (exerciseType != ExerciseTypes.case_personal_pronouns) {
      combos.addAll(GenitivExercises(dialect).general);
    }

    if (exerciseType == ExerciseTypes.case_adjectives ||
        exerciseType == ExerciseTypes.case_nouns_and_adjectives) {
      combos.removeWhere((element) => !element.sentenceParts.any((sp) =>
          sp.grammarType == GrammarTypes.adjective ||
          sp.grammarType == GrammarTypes.possessivePronoun));
    }

    for (int i = 0; i < combos.length; i++) {
      N.convertNonMatchingTypes(exerciseType, combos[i]);
    }

    combos.removeWhere(
        (element) => !element.sentenceParts.any((sp) => sp.isCorrectable));

    return combos
        .shufflePAN()
        .map((e) => CaseQuestionState(combos: e))
        .toList();
  }
}
