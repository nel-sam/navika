import 'package:navika/models/models.dart';
import 'package:navika/extensions.dart';

class CaseQuestionStateItem {
  PANCombo combos;
  late String userNounResponse;
  late String userPossPronResponse;
  late String userAdjResponse;
  late String userPersPronResponse;

  CaseQuestionStateItem({required this.combos}) {
    userNounResponse = '';
    userPossPronResponse = '';
    userAdjResponse = '';
    userPersPronResponse = '';
  }

  bool getIsCorrect() {
    final pos = getIsCorrectSingle(
        this.combos.correctPossPronouns, userPossPronResponse);
    final adj = getIsCorrectSingle(this.combos.correctAdjs, userAdjResponse);
    final noun = getIsCorrectSingle(this.combos.correctNouns, userNounResponse);
    final persPron = getIsCorrectSingle(
        this.combos.correctPersPronouns, userPersPronResponse);

    return pos && adj && noun && persPron;
  }

  bool getIsCorrectSingle(List<String> acceptedAnswers, String? actualAnswer) {
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
