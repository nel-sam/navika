import 'dart:collection';

import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';

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
  // ConjPronounTypes conjPronounTypes;
  // Genders gender;
  // bool isPlural;
  late HashMap<ConjPronounTypes, String> userEntryState =
      new HashMap<ConjPronounTypes, String>();
  late bool isCorrect;

  VerbQuestionStateItem({
    required this.tense,
    required this.verb,
    // required this.gender,
    // required this.isPlural,
    // required this.conjPronounTypes,
    this.isCorrect = false,
  });

  void updateIsCorrect() {
    if (this.userEntryState.length == 0) {
      this.isCorrect = false;
      return;
    }

    this.isCorrect = true;

    this.userEntryState.forEach((key, value) {
      String correctAnsw = this.verb.getConjugation(this.tense, key);
      if (value != correctAnsw) {
        this.isCorrect = false;
        return;
      }
    });
  }
}
