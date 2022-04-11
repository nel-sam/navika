import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
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
  int _activeIndex = 0;
  int _maxIndex = 0;
  late Function(List) createExercise;

  ExerciseNavNotifier({Cases? caseType, ExerciseTypes exerciseType = ExerciseTypes.unspecified, bool isVerb = false}) {
    if (isVerb) {
      this._maxIndex = VerbGenerators.getMaxIndex();
      createExercise = VerbGenerators.createExercise;
    } else {
      _maxIndex = BATCH_COUNT;
      _setCaseGenerator(caseType!);
    }

    _states.add(createExercise(_states));
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

    if (_activeIndex > _states.length - 1) {
      this._states.add(this.createExercise(_states));
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

  List shuffleAndClear({bool notify: true}) {
    _states.shuffle();
    _states.forEach((element) {
      element.clear();
    });

    if (notify) debouncedNotifyListeners();
    return _states;
  }

  _getRandomCaseExec(List a) {
    final random = Nrs.getRandomNumber(max: Cases.values.length);
    final caseType = Cases.values[random];

    switch (caseType) {
      case Cases.Nom:
        return NominativGenerators.createExercise(a);
      case Cases.Aku:
        return AkuzativGenerators.createExercise(a);
      case Cases.Ins:
        return InstrumentalGenerators.createExercise(a);
      case Cases.Dat:
        return DativGenerators.createExercise(a);
      case Cases.Lok:
        return LokativGenerators.createExercise(a);
      case Cases.All:
      case Cases.Gen:
        return GenitivGenerators.createExercise(a);
      case Cases.Vok:
        return VokativGenerators.createExercise(a);
    }
  }

  _setCaseGenerator(Cases caseType) {
    switch (caseType) {
      case Cases.All:
        createExercise = _getRandomCaseExec;
        break;
      case Cases.Nom:
        createExercise = NominativGenerators.createExercise;
        break;
      case Cases.Aku:
        createExercise = AkuzativGenerators.createExercise;
        break;
      case Cases.Ins:
        createExercise = InstrumentalGenerators.createExercise;
        break;
      case Cases.Dat:
        createExercise = DativGenerators.createExercise;
        break;
      case Cases.Lok:
        createExercise = LokativGenerators.createExercise;
        break;
      case Cases.Gen:
        createExercise = GenitivGenerators.createExercise;
        break;
      case Cases.Vok:
        createExercise = VokativGenerators.createExercise;
        break;
      default:
        break;
    }
  }
}
