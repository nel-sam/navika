import 'package:flutter/material.dart';

class Verb {
  String infinitive;
  String root;
  bool isReflexive;
  bool isIrregular;
  ConjugationSet present;
  ParticipleSet pastPerfect;
  Function(BuildContext context) getTranslation;

  Verb({
    required this.infinitive,
    required this.isReflexive,
    required this.getTranslation,
    this.isIrregular = false,
    required this.present,
    required this.pastPerfect,
    this.root = '',
  });

  String getParticleConj(ParticipleSet partSet, ConjPronounTypes key) {
    switch (key) {
      case ConjPronounTypes.jaMasc:
        return partSet.jaMasc;
      case ConjPronounTypes.JaFem:
        return partSet.jaFem;
      case ConjPronounTypes.tiMasc:
        return partSet.tiMasc;
      case ConjPronounTypes.tiFem:
        return partSet.tiFem;
      case ConjPronounTypes.on:
        return partSet.on;
      case ConjPronounTypes.ona:
        return partSet.ona;
      case ConjPronounTypes.ono:
        return partSet.ono;
      case ConjPronounTypes.miMasc:
        return partSet.miMasc;
      case ConjPronounTypes.miFem:
        return partSet.miFem;
      case ConjPronounTypes.viMasc:
        return partSet.viMasc;
      case ConjPronounTypes.viFem:
        return partSet.viFem;
      case ConjPronounTypes.oni:
        return partSet.oni;
      case ConjPronounTypes.one:
        return partSet.one;
      case ConjPronounTypes.onaPl:
        return partSet.onaPl;
    }
  }

  String getPresentCaseConj(ConjPronounTypes key) {
    switch (key) {
      case ConjPronounTypes.jaMasc:
      case ConjPronounTypes.JaFem:
        return this.present.ja.toString();
      case ConjPronounTypes.tiMasc:
      case ConjPronounTypes.tiFem:
        return this.present.ti.toString();
      case ConjPronounTypes.on:
      case ConjPronounTypes.ona:
      case ConjPronounTypes.ono:
        return this.present.on.toString();
      case ConjPronounTypes.miMasc:
      case ConjPronounTypes.miFem:
        return this.present.mi.toString();
      case ConjPronounTypes.viMasc:
      case ConjPronounTypes.viFem:
        return this.present.vi.toString();
      case ConjPronounTypes.oni:
      case ConjPronounTypes.one:
      case ConjPronounTypes.onaPl:
        return this.present.oni.toString();
    }
  }

  String getConjugation(VerbTenses tense, ConjPronounTypes key) {
    switch (tense) {
      case VerbTenses.PastPerfect:
        return getParticleConj(pastPerfect, key);
      case VerbTenses.Present:
        return getPresentCaseConj(key);
      case VerbTenses.PlusPerfect:
        return '';
      case VerbTenses.Future:
        return '';
      case VerbTenses.Aorist:
        return '';
      case VerbTenses.Imperfect:
        return '';
      case VerbTenses.Conditional:
        return '';
      case VerbTenses.Imperative:
        return '';
    }
  }
}

class ConjugationSet {
  String ja;
  String ti;

  String on;
  String ona;
  String ono;

  String mi;
  String vi;

  String oni;
  String one;
  String onaPl;

  ConjugationSet({
    this.ja = '',
    this.ti = '',
    this.on = '',
    this.ona = '',
    this.ono = '',
    this.mi = '',
    this.vi = '',
    this.oni = '',
    this.one = '',
    this.onaPl = '',
  });
}

class ParticipleSet {
  String jaMasc;
  String jaFem;
  String tiMasc;
  String tiFem;

  String on;
  String ona;
  String ono;

  String miMasc;
  String miFem;
  String viMasc;
  String viFem;

  String oni;
  String one;
  String onaPl;

  ParticipleSet({
    required this.jaMasc,
    required this.jaFem,
    required this.tiMasc,
    required this.tiFem,
    required this.on,
    required this.ona,
    required this.ono,
    required this.miMasc,
    required this.miFem,
    required this.viMasc,
    required this.viFem,
    required this.oni,
    required this.one,
    required this.onaPl,
  });
}

enum VerbTenses {
  PastPerfect,
  Present,
  PlusPerfect,
  Future,
  Aorist,
  Imperfect,
  Conditional,
  Imperative,
}

enum ConjPronounTypes {
  jaMasc,
  JaFem,
  tiMasc,
  tiFem,
  on,
  ona,
  ono,
  miMasc,
  miFem,
  viMasc,
  viFem,
  oni,
  one,
  onaPl,
}
