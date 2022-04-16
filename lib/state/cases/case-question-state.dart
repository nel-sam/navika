import 'package:navika/models/models.dart';
import 'package:nrs_flutter_lib/extensions.dart';

class CaseQuestionState {
  PANCombo combos;
  late String userNounResponse;
  late String userPossPronResponse;
  late String userAdjResponse;
  late String userPersonalPronounResponse;
  late bool isCorrect;

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

  bool _isCorrectSingle(List<String> acceptedAnswers, String? actualAnswer) {
    if (acceptedAnswers.length == 0 ||
        (acceptedAnswers.length == 0 && actualAnswer == '')) {
      return true;
    }

    return acceptedAnswers.containsCaseInsensitive(actualAnswer ?? "");
  }

  void _setIsCorrect() {
    final pos =
        _isCorrectSingle(this.combos.correctPossPronouns, userPossPronResponse);
    final adj =
        _isCorrectSingle(this.combos.correctAdjectives, userAdjResponse);
    final noun = _isCorrectSingle(this.combos.correctNouns, userNounResponse);
    final persPron = _isCorrectSingle(
        this.combos.correctPersonalPronouns, userPersonalPronounResponse);

    isCorrect = pos && adj && noun && persPron;
  }
}
