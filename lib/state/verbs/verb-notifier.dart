import 'package:flutter/foundation.dart';
import 'package:navika/lang_data/verbs.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/state/verbs/verb-question-state-item.dart';

class VerbNotifier with ChangeNotifier {
  late List<VerbQuestionStateItem> _exerciseItems;
  int _activeIndex = 0;

  VerbNotifier() {
    _exerciseItems = verbWordBank
        .map((verb) => VerbQuestionStateItem(
              verb: verb,
              notifyListeners: notifyListeners,
            ))
        .toList();

    _exerciseItems.shuffle();
  }

  updateState(String stateKey, String newValue, VerbTenses tense) {
    getActive().updateState(stateKey, newValue, tense);
    notifyListeners();
  }

  VerbQuestionStateItem getActive() {
    return _exerciseItems[_activeIndex];
  }

  clearInput() {
    getActive().clear();
    notifyListeners();
  }

  setPrevious() {
    if (_activeIndex <= 0) {
      _activeIndex = _exerciseItems.length - 1;
    } else {
      _activeIndex--;
    }

    notifyListeners();
  }

  setNext() {
    if (_activeIndex >= _exerciseItems.length - 1) {
      _activeIndex = 0;
    } else {
      _activeIndex++;
    }

    notifyListeners();
  }
}
