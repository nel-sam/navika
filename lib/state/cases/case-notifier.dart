import 'package:flutter/foundation.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-question-state-item.dart';
import 'package:navika/widgets/content-generators/akuzativ-generators.dart';
import 'package:navika/widgets/content-generators/nominativ-generators.dart';
import 'package:navika/widgets/content-generators/instrumental-generators.dart';
import 'package:navika/widgets/content-generators/dativ-generators.dart';
import 'package:navika/widgets/content-generators/genetiv-generators.dart';
import 'package:navika/widgets/content-generators/lokativ-generators.dart';
import 'package:navika/widgets/content-generators/vokativ-generators.dart';

class CaseNotifier with ChangeNotifier {
  List<CaseQuestionStateItem> _exerciseItems = [];
  int _activeIndex = 0;

  CaseNotifier({Cases? caseType}) {
    if (caseType == null) return;

    _exerciseItems = getItems(caseType);
  }

  List<CaseQuestionStateItem> getItems(Cases caseType) {
    List<CaseQuestionStateItem> items = [];

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

  void modifyStateItem(Cases caseType, CaseQuestionStateItem toModify,
      CaseQuestionStateItem newValue) {
    toModify.combos = newValue.combos;
    toModify.isCorrect = newValue.isCorrect;
    toModify.userAdjResponse = newValue.userAdjResponse;
    toModify.userNounResponse = newValue.userNounResponse;
    toModify.userPersPronResponse = newValue.userPersPronResponse;
    toModify.userPossPronResponse = newValue.userPossPronResponse;

    notifyListeners();
  }

  List<CaseQuestionStateItem> shuffleAndClear({bool notify: true}) {
    _exerciseItems.shuffle();
    _exerciseItems.forEach((element) {
      element.clear();
    });

    if (notify) notifyListeners();
    return _exerciseItems;
  }

  CaseQuestionStateItem getActive() {
    return _exerciseItems[_activeIndex];
  }

  updateNoun(String newValue) {
    getActive().userNounResponse = newValue;
    notifyListeners();
  }

  updatePossPronoun(String newValue) {
    getActive().userPossPronResponse = newValue;
    notifyListeners();
  }

  updateAdj(String newValue) {
    getActive().userAdjResponse = newValue;
    notifyListeners();
  }

  updatePersPronoun(String newValue) {
    getActive().userPersPronResponse = newValue;
    notifyListeners();
  }

  clearInput() {
    getActive().clear();
    notifyListeners();
  }

  setPrevious() {
    if (_activeIndex <= 0) {
      _activeIndex = _exerciseItems.length - 1;
    } else {
      _activeIndex--;
    }

    notifyListeners();
  }

  setNext() {
    if (_activeIndex >= _exerciseItems.length - 1) {
      _activeIndex = 0;
    } else {
      _activeIndex++;
    }

    notifyListeners();
  }
}
