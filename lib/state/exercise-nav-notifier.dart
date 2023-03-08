import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/state/content-generators/akuzativ-generators.dart';
import 'package:navika/state/content-generators/dativ-generators.dart';
import 'package:navika/state/content-generators/genitiv-generators.dart';
import 'package:navika/state/content-generators/instrumental-generators.dart';
import 'package:navika/state/content-generators/lokativ-generators.dart';
import 'package:navika/state/content-generators/nominativ-generators.dart';
import 'package:navika/state/content-generators/verb-generators.dart';
import 'package:navika/state/content-generators/vokativ-generators.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class ExerciseNavNotifier with ChangeNotifier {
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});
  List _states = [];
  late ExerciseTypes _exerciseType;
  int _activeIndex = 0;
  int _maxIndex = 0;
  late DialectType _dialect;
  final bool isPremium;

  ExerciseNavNotifier({
    required this.isPremium,
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
      _states = verbGenerator.createExercises(exerciseType, dialect);
    } else {
      _maxIndex = MAX_BATCH_COUNT;
      _setCaseStates(caseType!);
    }

    this._exerciseType = exerciseType;
  }

  void addSingleExercise(
      List<CaseQuestionState> outList, Function createExerciseFunc) {
    if (outList.isEmpty)
      outList = createExerciseFunc(_exerciseType, _dialect, isPremium);

    int randomNumber = Nrs.getRandomNumber(max: outList.length);
    int maxRetries = 10;

    while (outList.contains(outList[randomNumber]) && maxRetries-- > 0) {
      randomNumber = Nrs.getRandomNumber(max: outList.length);
    }

    _states.add(outList[randomNumber]);
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
    while (_states.length < MAX_BATCH_COUNT) {
      final random = Nrs.getRandomNumber(max: Cases.values.length);
      final caseType = Cases.values[random];
      List<CaseQuestionState> nom = [],
          aku = [],
          dat = [],
          ins = [],
          gen = [],
          lok = [],
          vok = [];

      switch (caseType) {
        case Cases.Nom:
          addSingleExercise(nom, NominativGenerators.createExercise);
          break;
        case Cases.Aku:
          addSingleExercise(aku, AkuzativGenerators.createExercise);
          break;
        case Cases.Ins:
          addSingleExercise(ins, InstrumentalGenerators.createExercise);
          break;
        case Cases.Dat:
          addSingleExercise(dat, DativGenerators.createExercise);
          break;
        case Cases.Lok:
          addSingleExercise(lok, LokativGenerators.createExercise);
          break;
        case Cases.All:
        case Cases.Gen:
          addSingleExercise(gen, GenitivGenerators.createExercise);
          break;
        case Cases.Vok:
          addSingleExercise(vok, VokativGenerators.createExercise);
          break;
      }
    }
  }

  _setCaseStates(Cases caseType) {
    switch (caseType) {
      case Cases.All:
        _states = _getRandomCaseExec();
        break;
      case Cases.Nom:
        _states = NominativGenerators.createExercise(
            _exerciseType, _dialect, isPremium);
        break;
      case Cases.Aku:
        _states = AkuzativGenerators.createExercise(
            _exerciseType, _dialect, isPremium);
        break;
      case Cases.Ins:
        _states = InstrumentalGenerators.createExercise(
            _exerciseType, _dialect, isPremium);
        break;
      case Cases.Dat:
        _states =
            DativGenerators.createExercise(_exerciseType, _dialect, isPremium);
        break;
      case Cases.Lok:
        _states = LokativGenerators.createExercise(
            _exerciseType, _dialect, isPremium);
        break;
      case Cases.Gen:
        _states = GenitivGenerators.createExercise(
            _exerciseType, _dialect, isPremium);
        break;
      case Cases.Vok:
        _states = VokativGenerators.createExercise(
            _exerciseType, _dialect, isPremium);
        break;
      default:
        break;
    }

    if (_states.length - 1 < _maxIndex) {
      _maxIndex = _states.length;
    }
  }
}
