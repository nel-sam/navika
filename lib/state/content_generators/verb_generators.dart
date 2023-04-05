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
        ...verbWordBankGeneral,
        ...verbsIjekavian,
      ];
    }
  }

  List<VerbQuestionStateItem> createExercises(
      ExerciseTypes exerciseType, DialectType dialect) {
    _verbBank.shuffle();
    return _verbBank.map((v) => VerbQuestionStateItem(verb: v)).toList();
  }

  int getMaxIndex() {
    return _verbBank.length;
  }
}
