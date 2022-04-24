import 'package:navika/lang_data/verbs.dart';
import 'package:navika/lang_data/words/ekavian/verbs_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/verbs_ijekavian.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/state/verbs/verb-question-state-item.dart';

class VerbGenerators {
  final DialectType dialect;
  late List<Verb> _verbBank;

  VerbGenerators({required this.dialect}) {
    if (this.dialect == DialectType.Serbia) {
      _verbBank = [
        ...verbWordBankGeneral,
        ...verbsEkavian,
      ];
    } else {
      _verbBank = [
        ..._verbBank,
        ...verbsIjekavian,
      ];
    }
  }

  createExercise(
      List avoidList, ExerciseTypes exerciseType, DialectType dialect) {
    _verbBank.shuffle();

    var verb =
        avoidList.length == 0 ? _verbBank[0] : _getFirstNewVerb(avoidList);

    return VerbQuestionStateItem(verb: verb);
  }

  int getMaxIndex() {
    return _verbBank.length;
  }

  _getFirstNewVerb(List avoidList) {
    var toAvoid = avoidList.map((e) => e.verb.infinitive);

    for (int i = 0; i < _verbBank.length; i++) {
      if (!toAvoid.contains(_verbBank[i].infinitive)) {
        return _verbBank[i];
      }
    }
  }
}
