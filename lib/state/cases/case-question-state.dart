import 'dart:collection';

import 'package:navika/models/models.dart';

class CaseQuestionState {
  PANCombo combos;
  late bool isCorrect;
  HashMap _userResponseCorrectStatus = new HashMap<String, bool>();

  // TODO: Remove below
  late String userNounResponse;
  late String userPossPronResponse;
  late String userAdjResponse;
  late String userPersonalPronounResponse;

  CaseQuestionState({required this.combos}) {
    userNounResponse = '';
    userPossPronResponse = '';
    userAdjResponse = '';
    userPersonalPronounResponse = '';
    isCorrect = false;
  }

  void clear() {
    userNounResponse = '';
    userPossPronResponse = '';
    userAdjResponse = '';
    userPersonalPronounResponse = '';
    _setIsCorrect();
  }

  // TODO: Deprecated
  updateAdj(String newValue) {
    userAdjResponse = newValue;
    _setIsCorrect();
  }

  updateNoun(String newValue) {
    userNounResponse = newValue;
    _setIsCorrect();
  }

  updatePersonalPronoun(String newValue) {
    userPersonalPronounResponse = newValue;
    _setIsCorrect();
  }

  updatePossPronoun(String newValue) {
    userPossPronResponse = newValue;
    _setIsCorrect();
  }

  // TODO: Only use this going forward
  updateUserInput(String key, bool isCorrect) {
    _userResponseCorrectStatus[key] = isCorrect;
    _setIsCorrect();
  }

  void _setIsCorrect() {
    isCorrect = _userResponseCorrectStatus.length > 0 &&
        !_userResponseCorrectStatus.values.contains(false);
  }
}
