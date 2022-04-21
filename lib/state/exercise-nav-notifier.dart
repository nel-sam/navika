import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/state/content-generators/nominativ-generators.dart';
import 'package:navika/state/content-generators/verb-generators.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class ExerciseNavNotifier with ChangeNotifier {
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});
  List _states = [];
  late ExerciseTypes _exerciseType;
  int _activeIndex = 0;
  int _maxIndex = 0;
  late DialectType _dialect;

  ExerciseNavNotifier({
    required DialectType dialect,
    required ExerciseTypes exerciseType,
    Cases? caseType,
    bool isVerb = false,
  }) {
    _exerciseType = exerciseType;
    _dialect = dialect;

    if (isVerb) {
      final verbGenerator = VerbGenerators(dialect: dialect);
      this._maxIndex = verbGenerator.getMaxIndex();
      //createExercise = verbGenerator.createExercise;
    } else {
      _maxIndex = BATCH_COUNT;
      _setStates(caseType!);
    }

    //_states.add(createExercise(_states, exerciseType, dialect));
    this._exerciseType = exerciseType;
  }

  void clearInput() {
    _states[_activeIndex].clear();
    debouncedNotifyListeners();
  }

  debouncedNotifyListeners() {
    if (_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(
        const Duration(milliseconds: DEBOUNCE_TIME), () => notifyListeners());
  }

  dynamic getActive() {
    return _states[_activeIndex];
  }

  double getProgressPercentage() {
    return (_activeIndex / _maxIndex) * 100;
  }

  setNext() {
    if (_activeIndex >= _maxIndex - 1) {
      _activeIndex = 0;
    } else {
      _activeIndex++;
    }

    // if (_activeIndex > _states.length - 1) {
    //   this._states.add(this.createExercise(_states, _exerciseType, _dialect));
    // }

    debouncedNotifyListeners();
  }

  setPrevious() {
    if (_activeIndex <= 0) {
      _activeIndex = _states.length - 1;
    } else {
      _activeIndex--;
    }

    debouncedNotifyListeners();
  }

  _getRandomCaseExec() {
    while (_states.length < BATCH_COUNT) {
      final random = Nrs.getRandomNumber(max: Cases.values.length);
      final caseType = Cases.values[random];
      CaseQuestionState newExercise;

      List<CaseQuestionState> nom = [];
      // TODO: Make these like nominativ
      // final aku = AkuzativGenerators.createExercise(_exerciseType, _dialect);
      // final dat = DativGenerators.createExercise(_exerciseType, _dialect);
      // final ins =
      //     InstrumentalGenerators.createExercise(_exerciseType, _dialect);
      // final gen = GenitivGenerators.createExercise(_exerciseType, _dialect);
      // final lok = LokativGenerators.createExercise(_exerciseType, _dialect);
      // final vok = VokativGenerators.createExercise(_exerciseType, _dialect);

      switch (caseType) {
        case Cases.Nom:
          if (nom.isEmpty)
            nom = NominativGenerators.createExercise(_exerciseType, _dialect);
          final randomNom = Nrs.getRandomNumber(max: nom.length);
          _states.add(nom[randomNom]);
          break;
        case Cases.Aku:
        case Cases.Ins:
        case Cases.Dat:
        case Cases.Lok:
        case Cases.All:
        case Cases.Gen:
        case Cases.Vok:
          break;
      }
    }
  }

  _setStates(Cases caseType) {
    switch (caseType) {
      case Cases.All:
        _states = _getRandomCaseExec();
        break;
      case Cases.Nom:
        _states = NominativGenerators.createExercise(_exerciseType, _dialect);
        break;
      // TODO: Implement the rest
      // case Cases.Aku:
      //   createExercise = AkuzativGenerators.createExercise;
      //   break;
      // case Cases.Ins:
      //   createExercise = InstrumentalGenerators.createExercise;
      //   break;
      // case Cases.Dat:
      //   createExercise = DativGenerators.createExercise;
      //   break;
      // case Cases.Lok:
      //   createExercise = LokativGenerators.createExercise;
      //   break;
      // case Cases.Gen:
      //   createExercise = GenitivGenerators.createExercise;
      //   break;
      // case Cases.Vok:
      //   createExercise = VokativGenerators.createExercise;
      //   break;
      default:
        break;
    }
  }
}
