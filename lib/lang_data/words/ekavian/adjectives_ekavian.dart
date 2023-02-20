import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';

class AdjectivesEkavian {
  static final Adjective bel = Adjective(
    dictionary: 'bel',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['beo','beli'], plural: ['beli']),
      feminine:
          new DeclensionByGender(singular: ['bela'], plural: ['bele']),
      neuter: new DeclensionByGender(singular: ['belo'], plural: ['bela']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['beli'], plural: ['bele']),
      feminine:
          new DeclensionByGender(singular: ['belu'], plural: ['bele']),
      neuter: new DeclensionByGender(singular: ['belo'], plural: ['bela']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['belim'], plural: ['belim']),
      feminine:
          new DeclensionByGender(singular: ['belom'], plural: ['belim']),
      neuter:
          new DeclensionByGender(singular: ['belim'], plural: ['belim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['belom'], plural: ['belim']),
      feminine:
          new DeclensionByGender(singular: ['beloj'], plural: ['belim']),
      neuter:
          new DeclensionByGender(singular: ['belom'], plural: ['belim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['belog'], plural: ['belih']),
      feminine:
          new DeclensionByGender(singular: ['bele'], plural: ['belih']),
      neuter:
          new DeclensionByGender(singular: ['belog'], plural: ['belih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
}
