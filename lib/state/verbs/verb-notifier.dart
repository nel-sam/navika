import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';

class VerbNotifier with ChangeNotifier {
  late Function() _getStateItem;
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  VerbNotifier(Function() getStateItem) {
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

  updateState(String stateKey, String newValue, VerbTenses tense) {
    _getStateItem().updateState(stateKey, newValue, tense);
    deboucedNotifyListeners();
  }
}
