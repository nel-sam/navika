import 'dart:collection';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/extensions.dart';

class VerbQuestionUserEntryStateItem {
  late String jaMasc;
  late String jaFem;
  late String tiMasc;
  late String tiFem;
  late String miMasc;
  late String miFem;
  late String on;
  late String ona;
  late String ono;
  late String viMasc;
  late String viFem;
  late String oni;
  late String one;
  late String onaPl;

  VerbQuestionUserEntryStateItem(String initialValue) {
    this.jaMasc = initialValue;
    this.jaFem = initialValue;
    this.tiMasc = initialValue;
    this.tiFem = initialValue;
    this.miMasc = initialValue;
    this.miFem = initialValue;
    this.on = initialValue;
    this.ona = initialValue;
    this.ono = initialValue;
    this.viMasc = initialValue;
    this.viFem = initialValue;
    this.oni = initialValue;
    this.one = initialValue;
    this.onaPl = initialValue;
  }
}

class VerbQuestionStateItem {
  Verb verb;
  VerbTenses tense;
  late var userEntryState = new HashMap<String, String>();
  late bool isAllCorrect;
  Function notifyListeners;

  VerbQuestionStateItem({
    required this.tense,
    required this.verb,
    required this.notifyListeners,
    this.isAllCorrect = false,
  }) {
    log('aqui');
  }

  void updateIsAllCorrect() {
    var allCorrect = true;

    ConjPronounTypes.values.forEach((key) {
      if (this.userEntryState.length == 0 ||
          !this.userEntryState.containsKey(key.toString())) {
        allCorrect = false;
      }

      var entryValue = this.userEntryState[key] ?? '';
      String correctAnsw = this.verb.getConjugation(this.tense, key);
      if (!entryValue.containsCaseInsensitive(correctAnsw)) {
        allCorrect = false;
      }
    });

    this.isAllCorrect = allCorrect;
    this.notifyListeners();
  }
}
