import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';

final List<Verb> verbsEkavian = [
  Verb(
    infinitive: 'videti',
    verbPerfectiveType: VerbPerfectiveTypes.Unspecified,
    isIrregular: true,
    isReflexive: true,
    getTranslation: (BuildContext context) => N.t('trans_vidjeti'),
    present: ConjugationSet(
      ja: 'vidim',
      ti: 'vidiš',
      on: 'vidi',
      mi: 'vidimo',
      vi: 'vidite',
      oni: 'vide',
    ),
    pastPerfect: ParticipleSet(
      singularMasc: 'vidio',
      singularFem: 'videla',
      pluralMasc: 'videli',
      pluralFem: 'videle',
      ono: 'videlo',
      onaPl: 'videla',
    ),
  ),
  Verb(
    infinitive: 'razumeti',
    isIrregular: false,
    isReflexive: false,
    verbPerfectiveType: VerbPerfectiveTypes.Imperfective,
    getTranslation: (BuildContext context) => N.t('trans_razumjeti'),
    present: ConjugationSet(
      ja: 'razumem',
      ti: 'razumeš',
      on: 'razume',
      mi: 'razumemo',
      vi: 'razumete',
      oni: 'razumu',
    ),
    pastPerfect: ParticipleSet(
      singularMasc: 'razumio',
      singularFem: 'razumela',
      pluralMasc: 'razumeli',
      pluralFem: 'razumele',
      ono: 'razumelo',
      onaPl: 'razumela',
    ),
  ),
];
