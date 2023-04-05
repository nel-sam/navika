import 'package:navika/extensions.dart';
import 'package:navika/lang_data/cases_exercises/vokativ_exercises.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/cases/case_question_state.dart';
import 'package:navika/utilities/navika_helpers.dart';

class VokativGenerators {
  static List<CaseQuestionState> createExercise(
    ExerciseTypes exerciseType,
    DialectType dialect,
    bool isPremium,
  ) {
    List<PANCombo> combos = VokativExercises(dialect).general;

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
