import 'dart:collection';

import 'package:navika/models/models.dart';

class CaseQuestionState {
  PANCombo combos;
  late bool isCorrect;
  HashMap _userResponseCorrectStatus = new HashMap<String, bool>();
  HashMap _userResponses = new HashMap<String, String>();

  CaseQuestionState({required this.combos}) {
    isCorrect = false;
  }

  void clear() {
    _userResponses.clear();
    _userResponseCorrectStatus.clear();
    _setIsCorrect();
  }

  String getUserInput(String key) {
    if (!_userResponses.containsKey(key)) {
      _userResponses[key] = '';
      _userResponseCorrectStatus[key] = false;
    }

    return _userResponses[key];
  }

  updateUserInput(String key, String newVal, bool isCorrect) {
    _userResponseCorrectStatus[key] = isCorrect;
    _userResponses[key] = newVal;
    _setIsCorrect();
  }

  void _setIsCorrect() {
    isCorrect = _userResponseCorrectStatus.length > 0 &&
        !_userResponseCorrectStatus.values.contains(false);
  }
}
