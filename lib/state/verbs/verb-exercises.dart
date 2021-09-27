import 'package:flutter/foundation.dart';
import 'package:navika/lang_data/verbs.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/state/verbs/verb-question-state-item.dart';

class VerbExercises with ChangeNotifier {
  late List<VerbQuestionStateItem> exerciseItems;

  VerbExercises() {
    exerciseItems = verbWordBank
        .map((verb) => VerbQuestionStateItem(
              verb: verb,
              isPlural: false,
              gender: Genders.Masculine,
              tense: VerbTenses.PastPerfect,
              conjPronounTypes: ConjPronounTypes.JaMasc,
            ))
        .toList();
  }

  void modifyStateItem(
      VerbQuestionStateItem toModify, VerbQuestionStateItem newValue) {
    toModify.gender = newValue.gender;
    toModify.isCorrect = newValue.isCorrect;
    toModify.verb = newValue.verb;

    notifyListeners();
  }
}
