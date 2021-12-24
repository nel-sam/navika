class Verb {
  String infinitive;
  String root;
  bool isReflexive;
  bool isIrregular;
  ConjugationSet? present;
  ParticipleSet? pastPerfect;

  Verb({
    required this.infinitive,
    required this.isReflexive,
    this.isIrregular = false,
    this.present,
    this.pastPerfect,
    this.root = '',
  });

  String getParticleConj(
      ParticipleSet partSet, ConjPronounTypes conjPronounType) {
    switch (conjPronounType) {
      case ConjPronounTypes.JaMasc:
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

  String getConjugation(VerbTenses tense, ConjPronounTypes conjPronounType) {
    switch (tense) {
      case VerbTenses.PastPerfect:
        if (pastPerfect == null) {
          return '';
        } else {
          return getParticleConj(pastPerfect!, conjPronounType);
        }
      case VerbTenses.Present:
        return '';
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
  JaMasc,
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
