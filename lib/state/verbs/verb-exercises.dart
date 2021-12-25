import 'package:flutter/foundation.dart';
import 'package:navika/lang_data/verbs.dart';
import 'package:navika/state/verbs/verb-question-state-item.dart';

class VerbExercises with ChangeNotifier {
  late List<VerbQuestionStateItem> exerciseItems;

  VerbExercises() {
    exerciseItems = verbWordBank
        .map((verb) => VerbQuestionStateItem(
              verb: verb,
              notifyListeners: notifyListeners,
            ))
        .toList();

    exerciseItems.shuffle();
  }
}
