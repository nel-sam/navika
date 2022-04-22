import 'package:navika/lang_data/cases_exercises/nominativ_exercises.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';

class NominativGenerators {
  static List<CaseQuestionState> createExercise(
    ExerciseTypes exerciseType,
    DialectType dialect,
    bool isPremium,
  ) {
    List<PANCombo> combos = [];

    if (exerciseType == ExerciseTypes.case_personal_pronouns) {
      combos.addAll(NominativExercises(dialect).personalPronouns);
    } else if (isPremium) {
      combos.addAll(NominativExercises(dialect).premium);
    }

    if (exerciseType != ExerciseTypes.case_personal_pronouns) {
      combos.addAll(NominativExercises(dialect).level1);
    }

    for (int i = 0; i < combos.length; i++) {
      N.convertToExerciseTypes(exerciseType, combos[i]);
    }

    return combos.map((e) => CaseQuestionState(combos: e)).toList();
  }
}
