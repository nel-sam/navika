import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';

class AdjectivesIjekavian {
  static final Adjective najljepsi = Adjective(
    dictionary: 'najljepši',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najljepši'], plural: ['najljepši']),
      feminine:
          new DeclensionByGender(singular: ['najljepša'], plural: ['najljepše']),
      neuter: new DeclensionByGender(singular: ['najljepšo'], plural: ['najljepša']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najljepši'], plural: ['najljepše']),
      feminine:
          new DeclensionByGender(singular: ['najljepšu'], plural: ['najljepše']),
      neuter: new DeclensionByGender(singular: ['najljepšo'], plural: ['najljepša']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najljepšim'], plural: ['najljepšim']),
      feminine:
          new DeclensionByGender(singular: ['najljepšom'], plural: ['najljepšim']),
      neuter:
          new DeclensionByGender(singular: ['najljepšim'], plural: ['najljepšim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najljepšom'], plural: ['najljepšim']),
      feminine:
          new DeclensionByGender(singular: ['najljepšoj'], plural: ['najljepšim']),
      neuter:
          new DeclensionByGender(singular: ['najljepšom'], plural: ['najljepšim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najljepšeg'], plural: ['najljepših']),
      feminine:
          new DeclensionByGender(singular: ['najljepše'], plural: ['najljepših']),
      neuter:
          new DeclensionByGender(singular: ['najljepšeg'], plural: ['najljepših']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );

  static final Adjective lijep = Adjective(
    dictionary: 'lijep',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lijepi'], plural: ['lijepi']),
      feminine:
          new DeclensionByGender(singular: ['lijepa'], plural: ['lijepe']),
      neuter: new DeclensionByGender(singular: ['lijepo'], plural: ['lijepa']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lijepi'], plural: ['lijepe']),
      feminine:
          new DeclensionByGender(singular: ['lijepu'], plural: ['lijepe']),
      neuter: new DeclensionByGender(singular: ['lijepo'], plural: ['lijepa']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lijepim'], plural: ['lijepim']),
      feminine:
          new DeclensionByGender(singular: ['lijepom'], plural: ['lijepim']),
      neuter:
          new DeclensionByGender(singular: ['lijepim'], plural: ['lijepim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lijepom'], plural: ['lijepim']),
      feminine:
          new DeclensionByGender(singular: ['lijepoj'], plural: ['lijepim']),
      neuter:
          new DeclensionByGender(singular: ['lijepom'], plural: ['lijepim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lijepog'], plural: ['lijepih']),
      feminine:
          new DeclensionByGender(singular: ['lijepe'], plural: ['lijepih']),
      neuter:
          new DeclensionByGender(singular: ['lijepog'], plural: ['lijepih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );

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
          new DeclensionByGender(singular: ['bijelim'], plural: ['bijelim']),
      feminine:
          new DeclensionByGender(singular: ['bijelom'], plural: ['bijelim']),
      neuter:
          new DeclensionByGender(singular: ['bijelim'], plural: ['bijelim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['bijelom'], plural: ['bijelim']),
      feminine:
          new DeclensionByGender(singular: ['bijeloj'], plural: ['bijelim']),
      neuter:
          new DeclensionByGender(singular: ['bijelom'], plural: ['bijelim']),
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
