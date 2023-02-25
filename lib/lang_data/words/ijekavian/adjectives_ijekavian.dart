import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';

class AdjectivesIjekavian {
  static final Adjective bijel = Adjective(
    dictionary: 'bijel',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['bijel'], plural: ['bijeli']),
      feminine:
          new DeclensionByGender(singular: ['bijela'], plural: ['bijele']),
      neuter: new DeclensionByGender(singular: ['bijelo'], plural: ['bijela']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['bijeli'], plural: ['bijele']),
      feminine:
          new DeclensionByGender(singular: ['bijelu'], plural: ['bijele']),
      neuter: new DeclensionByGender(singular: ['bijelo'], plural: ['bijela']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['bijelim'], plural: ['bijelima']),
      feminine:
          new DeclensionByGender(singular: ['bijelom'], plural: ['bijelima']),
      neuter:
          new DeclensionByGender(singular: ['bijelim'], plural: ['bijelima']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['bijelom'], plural: ['bijelima']),
      feminine:
          new DeclensionByGender(singular: ['bijeloj'], plural: ['bijelima']),
      neuter:
          new DeclensionByGender(singular: ['bijelom'], plural: ['bijelima']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['bijelog'], plural: ['bijelih']),
      feminine:
          new DeclensionByGender(singular: ['bijele'], plural: ['bijelih']),
      neuter:
          new DeclensionByGender(singular: ['bijelog'], plural: ['bijelih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
}
