import 'dart:collection';
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
  //VerbTenses tense;
  late var userEntryState = new HashMap<String, String>();
  late bool isAllCorrect;
  Function notifyListeners;

  VerbQuestionStateItem({
    //required this.tense,
    required this.verb,
    required this.notifyListeners,
    this.isAllCorrect = false,
  });

  List<String> getKeyCollection(VerbTenses tense) {
    if (tense == VerbTenses.Present) {
      return [
        ConjPronounTypes.jaMasc.toString(),
        ConjPronounTypes.tiMasc.toString(),
        ConjPronounTypes.on.toString(),
        ConjPronounTypes.miMasc.toString(),
        ConjPronounTypes.viMasc.toString(),
        ConjPronounTypes.oni.toString(),
      ];
    } else if (tense == VerbTenses.PastPerfect) {
      return ConjPronounTypes.values.map((v) => v.toString()).toList();
    }

    return [];
  }

  void updateState(String stateKey, String newValue, VerbTenses tense) {
    this.userEntryState[stateKey] = newValue;
    var allCorrect = true;
    var keyCollection = getKeyCollection(tense);

    keyCollection.forEach((key) {
      if (this.userEntryState.length == 0 ||
          !this.userEntryState.containsKey(key)) {
        allCorrect = false;
      }

      var entryValue = this.userEntryState[key] ?? '';
      var conjPronounType = ConjPronounTypes.values
          .firstWhere((e) => e.toString().equalsCaseInsensitive(key));
      var correctAnsw = this.verb.getConjugation(tense, conjPronounType);

      if (!entryValue.equalsCaseInsensitive(correctAnsw)) {
        allCorrect = false;
      }
    });

    this.isAllCorrect = allCorrect;
    this.notifyListeners();
  }

  void clear() {
    userEntryState.clear();
  }
}
