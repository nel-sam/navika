import 'package:navika/models/models.dart';

class CaseQuestionStateItem {
  PANCombo combos;
  late bool isCorrect = false;
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

  bool checkAnswers() {
    final pos =
        getIsCorrect(this.combos.correctPossPronouns, userPossPronResponse);
    final adj = getIsCorrect(this.combos.correctAdjs, userAdjResponse);
    final noun = getIsCorrect(this.combos.correctNouns, userNounResponse);
    final persPron =
        getIsCorrect(this.combos.correctPersPronouns, userPersPronResponse);

    return pos && adj && noun && persPron;
  }

  bool getIsCorrect(List<String> acceptedAnswers, String? actualAnswer) {
    if (acceptedAnswers.length == 0 ||
        (acceptedAnswers.length == 0 && actualAnswer == '')) {
      return true;
    }

    return acceptedAnswers.contains(actualAnswer);
  }
}