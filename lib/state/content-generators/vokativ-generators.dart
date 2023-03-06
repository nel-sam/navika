import 'package:navika/extensions.dart';
import 'package:navika/lang_data/cases_exercises/vokativ_exercises.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';

class VocativGenerators {
  static List<CaseQuestionState> createExercise(
    ExerciseTypes exerciseType,
    DialectType dialect,
    bool isPremium,
  ) {
    List<PANCombo> combos = VocativExercises(dialect).general;

    for (int i = 0; i < combos.length; i++) {
      N.convertToExerciseTypes(exerciseType, combos[i]);
    }

    return combos
        .shufflePAN()
        .map((e) => CaseQuestionState(combos: e))
        .toList();
  }
}
