import 'package:navika/models/verb.dart';

final List<Verb> verbWordBank = [
  Verb(
    infinitive: 'biti',
    isReflexive: true,
    present: ConjugationSet(
      ja: 'sam',
      ti: 'si',
      on: 'je',
      ona: 'je',
      ono: 'je',
      mi: 'smo',
      vi: 'ste',
      oni: 'su',
      one: 'su',
      onaPl: 'su',
    ),
    pastPerfect: ParticipleSet(
      jaMasc: 'bio',
      jaFem: 'bila',
      tiMasc: 'bio',
      tiFem: 'bila',
      miMasc: 'bili',
      miFem: 'bile',
      on: 'bio',
      ona: 'bila',
      ono: 'bilo',
      viMasc: 'bili',
      viFem: 'bile',
      oni: 'bili',
      one: 'bile',
      onaPl: 'bila',
    ),
  )
];
