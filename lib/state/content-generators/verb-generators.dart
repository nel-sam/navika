import 'package:navika/lang_data/verbs.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/verbs/verb-question-state-item.dart';

class VerbGenerators {
  static createExercise(List avoidList, ExerciseTypes exerciseType) {
    verbWordBank.shuffle();

    var verb =
        avoidList.length == 0 ? verbWordBank[0] : _getFirstNewVerb(avoidList);

    return VerbQuestionStateItem(verb: verb);
  }

  static int getMaxIndex() {
    return verbWordBank.length;
  }

  static _getFirstNewVerb(List avoidList) {
    var avoidListInfs = avoidList.map((e) => e.verb.infinitive);

    for (int i = 0; i < verbWordBank.length; i++) {
      if (!avoidListInfs.contains(verbWordBank[i].infinitive)) {
        return verbWordBank[i];
      }
    }
  }
}
