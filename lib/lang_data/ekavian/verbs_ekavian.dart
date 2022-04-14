import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';

final List<Verb> verbsEkavian = [
  // TODO: vidjeti na srpksi?
  // Verb(
  //   infinitive: 'vidjeti',
  //   verbPerfectiveType: VerbPerfectiveTypes.Unspecified,
  //   isIrregular: true,
  //   isReflexive: true,
  //   getTranslation: (BuildContext context) =>
  //       AppLocalizations.of(context)!.trans_vidjeti,
  //   present: ConjugationSet(
  //     ja: 'vidim',
  //     ti: 'vidiš',
  //     on: 'vidi',
  //     mi: 'vidimo',
  //     vi: 'vidite',
  //     oni: 'vide',
  //   ),
  //   pastPerfect: ParticipleSet(
  //     singularMasc: 'vidio',
  //     singularFem: 'vidjela',
  //     pluralMasc: 'vidjeli',
  //     pluralFem: 'vidjele',
  //     ono: 'vidjelo',
  //     onaPl: 'vidjela',
  //   ),
  // ),
  Verb(
    infinitive: 'razumeti',
    isIrregular: false,
    isReflexive: false,
    verbPerfectiveType: VerbPerfectiveTypes.Imperfective,
    getTranslation: (BuildContext context) =>
        AppLocalizations.of(context)!.trans_razumjeti,
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
