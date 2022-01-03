import 'package:flutter/material.dart';

class CyrillicStateItem {
  final Function notifyListeners;
  final String latinString;
  final String cyrillicString;
  final String Function(BuildContext) getTranslation;

  String userInput = '';

  CyrillicStateItem({
    required this.latinString,
    required this.cyrillicString,
    required this.notifyListeners,
    required this.getTranslation,
  });

  void updateInput(String newVal) {
    this.userInput = newVal;
    this.notifyListeners();
  }
}
