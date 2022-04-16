import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';

final List<Verb> verbsIjekavian = [
  Verb(
    infinitive: 'vidjeti',
    verbPerfectiveType: VerbPerfectiveTypes.Unspecified,
    isIrregular: true,
    isReflexive: true,
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.trans_vidjeti,
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
      singularFem: 'vidjela',
      pluralMasc: 'vidjeli',
      pluralFem: 'vidjele',
      ono: 'vidjelo',
      onaPl: 'vidjela',
    ),
  ),
  Verb(
    infinitive: 'razumjeti',
    isIrregular: false,
    isReflexive: false,
    verbPerfectiveType: VerbPerfectiveTypes.Imperfective,
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.trans_razumjeti,
    present: ConjugationSet(
      ja: 'razumijem',
      ti: 'razumiješ',
      on: 'razumije',
      mi: 'razumijemo',
      vi: 'razumijete',
      oni: 'razumiju',
    ),
    pastPerfect: ParticipleSet(
      singularMasc: 'razumio',
      singularFem: 'razumjela',
      pluralMasc: 'razumjeli',
      pluralFem: 'razumjele',
      ono: 'razumjelo',
      onaPl: 'razumjela',
    ),
  ),
];
