import 'package:navika/lang_data/verbs.dart';
import 'package:navika/state/verbs/verb-question-state-item.dart';

class VerbGenerators {
  static int getMaxIndex() {
    return verbWordBank.length;
  }

  static createExercise(List avoidList) {
    verbWordBank.shuffle();

    var verb =
        avoidList.length == 0 ? verbWordBank[0] : _getFirstNewVerb(avoidList);

    return VerbQuestionStateItem(verb: verb);
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
