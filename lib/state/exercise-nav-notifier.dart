import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/state/content-generators/akuzativ-generators.dart';
import 'package:navika/state/content-generators/dativ-generators.dart';
import 'package:navika/state/content-generators/genetiv-generators.dart';
import 'package:navika/state/content-generators/instrumental-generators.dart';
import 'package:navika/state/content-generators/lokativ-generators.dart';
import 'package:navika/state/content-generators/nominativ-generators.dart';
import 'package:navika/state/content-generators/vokativ-generators.dart';

class ExerciseNavNotifier with ChangeNotifier {
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});
  List<CaseQuestionState> _states = [];
  int _activeIndex = 0;

  ExerciseNavNotifier({Cases? caseType}) {
    if (caseType == null) return;

    _states = getItems(caseType);
  }

  List<CaseQuestionState> getItems(Cases caseType) {
    List<CaseQuestionState> items = [];

    switch (caseType) {
      case Cases.All:
        items = NominativGenerators.initializePANStateItems();
        items.addAll(AkuzativGenerators.initializePANStateItems());
        items.addAll(InstrumentalGenerators.initializePANStateItems());
        items.addAll(DativGenerators.initializePANStateItems());
        items.addAll(LokativGenerators.initializePANStateItems());
        items.addAll(GenetivGenerators.initializePANStateItems());
        items.addAll(VokativGenerators.initializePANStateItems());
        break;
      case Cases.Nom:
        items = NominativGenerators.initializePANStateItems();
        break;
      case Cases.Aku:
        items = AkuzativGenerators.initializePANStateItems();
        break;
      case Cases.Ins:
        items = InstrumentalGenerators.initializePANStateItems();
        break;
      case Cases.Dat:
        items = DativGenerators.initializePANStateItems();
        break;
      case Cases.Lok:
        items = LokativGenerators.initializePANStateItems();
        break;
      case Cases.Gen:
        items = GenetivGenerators.initializePANStateItems();
        break;
      case Cases.Vok:
        items = VokativGenerators.initializePANStateItems();
        break;
      default:
        break;
    }

    items.shuffle();
    return items;
  }

  deboucedNotifyListeners() {
    if (!_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(
        const Duration(milliseconds: DEBOUNCE_TIME), () => notifyListeners());
  }

  List shuffleAndClear({bool notify: true}) {
    _states.shuffle();
    _states.forEach((element) {
      element.clear();
    });

    if (notify) deboucedNotifyListeners();
    return _states;
  }

  getActive() {
    return _states[_activeIndex];
  }

  void clearInput() {
    _states[_activeIndex].clear();
    deboucedNotifyListeners();
  }

  setPrevious() {
    if (_activeIndex <= 0) {
      _activeIndex = _states.length - 1;
    } else {
      _activeIndex--;
    }

    deboucedNotifyListeners();
  }

  setNext() {
    if (_activeIndex >= _states.length - 1) {
      _activeIndex = 0;
    } else {
      _activeIndex++;
    }

    deboucedNotifyListeners();
  }
}
