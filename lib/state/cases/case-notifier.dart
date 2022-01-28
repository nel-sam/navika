import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class CaseNotifier extends ChangeNotifier {
  late Function() _getStateItem;
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  CaseNotifier(Function() getStateItem) {
    _getStateItem = getStateItem;
  }

  deboucedNotifyListeners() {
    if (!_debounce.isActive) {
      _debounce.cancel();
    }

    _debounce = Timer(
        const Duration(milliseconds: DEBOUNCE_TIME), () => notifyListeners());
  }

  getStateItem() {
    return _getStateItem();
  }

  updateNoun(String newValue) {
    _getStateItem().userNounResponse = newValue;
    deboucedNotifyListeners();
  }

  updatePossPronoun(String newValue) {
    _getStateItem().userPossPronResponse = newValue;
    deboucedNotifyListeners();
  }

  updateAdj(String newValue) {
    _getStateItem().userAdjResponse = newValue;
    deboucedNotifyListeners();
  }

  updatePersPronoun(String newValue) {
    _getStateItem().userPersPronResponse = newValue;
    deboucedNotifyListeners();
  }
}
