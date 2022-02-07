import 'package:navika/models/models.dart';
import 'package:navika/extensions.dart';

class CaseQuestionState {
  PANCombo combos;
  late String userNounResponse;
  late String userPossPronResponse;
  late String userAdjResponse;
  late String userPersPronResponse;
  late bool isCorrect;

  CaseQuestionState({required this.combos}) {
    userNounResponse = '';
    userPossPronResponse = '';
    userAdjResponse = '';
    userPersPronResponse = '';
    isCorrect = false;
  }

  void setIsCorrect() {
    final pos =
        _isCorrectSingle(this.combos.correctPossPronouns, userPossPronResponse);
    final adj = _isCorrectSingle(this.combos.correctAdjs, userAdjResponse);
    final noun = _isCorrectSingle(this.combos.correctNouns, userNounResponse);
    final persPron =
        _isCorrectSingle(this.combos.correctPersPronouns, userPersPronResponse);

    isCorrect = pos && adj && noun && persPron;
  }

  bool _isCorrectSingle(List<String> acceptedAnswers, String? actualAnswer) {
    if (acceptedAnswers.length == 0 ||
        (acceptedAnswers.length == 0 && actualAnswer == '')) {
      return true;
    }

    return acceptedAnswers.containsCaseInsensitive(actualAnswer ?? "");
  }

  void clear() {
    userNounResponse = '';
    userPossPronResponse = '';
    userAdjResponse = '';
    userPersPronResponse = '';
    setIsCorrect();
  }

  updateNoun(String newValue) {
    userNounResponse = newValue;
    setIsCorrect();
  }

  updatePossPronoun(String newValue) {
    userPossPronResponse = newValue;
    setIsCorrect();
  }

  updateAdj(String newValue) {
    userAdjResponse = newValue;
    setIsCorrect();
  }

  updatePersPronoun(String newValue) {
    userPersPronResponse = newValue;
    setIsCorrect();
  }
}
