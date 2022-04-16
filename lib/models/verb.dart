import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';

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

class ConjugationSet {
  String ja;
  String ti;
  String on;
  String mi;
  String vi;
  String oni;

  ConjugationSet({
    this.ja = '',
    this.ti = '',
    this.on = '',
    this.mi = '',
    this.vi = '',
    this.oni = '',
  });
}

class ParticipleSet {
  String singularMasc;
  String singularFem;
  String ono;
  String pluralMasc;
  String pluralFem;
  String onaPl;

  ParticipleSet({
    required this.singularMasc,
    required this.singularFem,
    required this.ono,
    required this.pluralMasc,
    required this.pluralFem,
    required this.onaPl,
  });
}

class Verb {
  String infinitive;
  String root;
  bool isReflexive;
  bool isIrregular;
  VerbPerfectiveTypes verbPerfectiveType;
  ConjugationSet present;
  ParticipleSet pastPerfect;
  Function(BuildContext context) getTranslation;

  Verb({
    required this.infinitive,
    required this.isReflexive,
    required this.getTranslation,
    required this.verbPerfectiveType,
    this.isIrregular = false,
    required this.present,
    required this.pastPerfect,
    this.root = '',
  });

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

  String getParticleConj(ParticipleSet partSet, ConjPronounTypes key) {
    switch (key) {
      case ConjPronounTypes.jaMasc:
        return partSet.singularMasc;
      case ConjPronounTypes.JaFem:
        return partSet.singularFem;
      case ConjPronounTypes.tiMasc:
        return partSet.singularMasc;
      case ConjPronounTypes.tiFem:
        return partSet.singularFem;
      case ConjPronounTypes.on:
        return partSet.singularMasc;
      case ConjPronounTypes.ona:
        return partSet.singularFem;
      case ConjPronounTypes.ono:
        return partSet.ono;
      case ConjPronounTypes.miMasc:
        return partSet.pluralMasc;
      case ConjPronounTypes.miFem:
        return partSet.pluralFem;
      case ConjPronounTypes.viMasc:
        return partSet.pluralMasc;
      case ConjPronounTypes.viFem:
        return partSet.pluralFem;
      case ConjPronounTypes.oni:
        return partSet.pluralMasc;
      case ConjPronounTypes.one:
        return partSet.pluralFem;
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
