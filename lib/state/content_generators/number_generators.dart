import 'package:navika/extensions.dart';
import 'package:navika/lang_data/cases_exercises/number_counting_exercises.dart';
import 'package:navika/lang_data/cases_exercises/number_ordinal_exercises.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/state/cases/case_question_state.dart';

class NumberGenerators {
  final DialectType dialect;

  NumberGenerators({required this.dialect});

  static List<CaseQuestionState> createExercise(
    ExerciseTypes exerciseType,
    DialectType dialect,
    bool isPremium,
  ) {
    List<PANCombo> combos = [];

    if (exerciseType == ExerciseTypes.numbers_counting) {
      combos.addAll(NumberCountingExercises(dialect: dialect).ages);
      combos.addAll(NumberCountingExercises(dialect: dialect).countingThings);
    } else if (exerciseType == ExerciseTypes.numbers_ordinal) {
      combos.addAll(NumberOrdinalExercises(dialect: dialect).general);
    }

    return combos
        .shufflePAN()
        .map((e) => CaseQuestionState(combos: e))
        .toList();
  }
}
