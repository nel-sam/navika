import 'package:navika/models/models.dart';
import 'package:navika/extensions.dart';

class CaseQuestionState {
  PANCombo combos;
  late String userNounResponse;
  late String userPossPronResponse;
  late String userAdjResponse;
  late String userPersPronResponse;

  CaseQuestionState({required this.combos}) {
    userNounResponse = '';
    userPossPronResponse = '';
    userAdjResponse = '';
    userPersPronResponse = '';
  }

  bool getIsCorrect() {
    final pos =
        _isCorrectSingle(this.combos.correctPossPronouns, userPossPronResponse);
    final adj = _isCorrectSingle(this.combos.correctAdjs, userAdjResponse);
    final noun = _isCorrectSingle(this.combos.correctNouns, userNounResponse);
    final persPron =
        _isCorrectSingle(this.combos.correctPersPronouns, userPersPronResponse);

    return pos && adj && noun && persPron;
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
  }
}
