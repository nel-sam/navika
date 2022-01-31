import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navika/constants.dart';

class WordOrderNotifier extends ChangeNotifier {
  late Function() _getStateItem;
  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});

  WordOrderNotifier(Function() getStateItem) {
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

  updateState(String newValue) {
    _getStateItem().updateState(newValue);
    deboucedNotifyListeners();
  }
}
