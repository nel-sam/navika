import 'package:navika/lang_data/cases_exercises/nominativ_exercises.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';

class NominativGenerators {
  static List<CaseQuestionState> createExercise(
    ExerciseTypes exerciseType,
    DialectType dialect,
  ) {
    final PANCombo combo = NominativExercises(dialect).level1.first;

    N.convertToExerciseTypes(exerciseType, combo);

    return [CaseQuestionState(combos: combo)];
  }
}
