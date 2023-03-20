import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';

class AdjectivesEkavian {
  static final Adjective najlepsi = Adjective(
    dictionary: 'najlepši',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najlepši'], plural: ['najlepši']),
      feminine:
          new DeclensionByGender(singular: ['najlepša'], plural: ['najlepše']),
      neuter: new DeclensionByGender(singular: ['najlepšo'], plural: ['najlepša']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najlepši'], plural: ['najlepše']),
      feminine:
          new DeclensionByGender(singular: ['najlepšu'], plural: ['najlepše']),
      neuter: new DeclensionByGender(singular: ['najlepšo'], plural: ['najlepša']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najlepšim'], plural: ['najlepšim']),
      feminine:
          new DeclensionByGender(singular: ['najlepšom'], plural: ['najlepšim']),
      neuter:
          new DeclensionByGender(singular: ['najlepšim'], plural: ['najlepšim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najlepšom'], plural: ['najlepšim']),
      feminine:
          new DeclensionByGender(singular: ['najlepšoj'], plural: ['najlepšim']),
      neuter:
          new DeclensionByGender(singular: ['najlepšom'], plural: ['najlepšim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najlepšeg'], plural: ['najlepših']),
      feminine:
          new DeclensionByGender(singular: ['najlepše'], plural: ['najlepših']),
      neuter:
          new DeclensionByGender(singular: ['najlepšeg'], plural: ['najlepših']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );

  static final Adjective lep = Adjective(
    dictionary: 'lep',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lepi'], plural: ['lepi']),
      feminine:
          new DeclensionByGender(singular: ['lepa'], plural: ['lepe']),
      neuter: new DeclensionByGender(singular: ['lepo'], plural: ['lepa']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lepi'], plural: ['lepe']),
      feminine:
          new DeclensionByGender(singular: ['lepu'], plural: ['lepe']),
      neuter: new DeclensionByGender(singular: ['lepo'], plural: ['lepa']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lepim'], plural: ['lepim']),
      feminine:
          new DeclensionByGender(singular: ['lepom'], plural: ['lepim']),
      neuter:
          new DeclensionByGender(singular: ['lepim'], plural: ['lepim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lepom'], plural: ['lepim']),
      feminine:
          new DeclensionByGender(singular: ['lepoj'], plural: ['lepim']),
      neuter:
          new DeclensionByGender(singular: ['lepom'], plural: ['lepim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['lepog'], plural: ['lepih']),
      feminine:
          new DeclensionByGender(singular: ['lepe'], plural: ['lepih']),
      neuter:
          new DeclensionByGender(singular: ['lepog'], plural: ['lepih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );

  static final Adjective bel = Adjective(
    dictionary: 'bel',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['beo', 'beli'], plural: ['beli']),
      feminine: new DeclensionByGender(singular: ['bela'], plural: ['bele']),
      neuter: new DeclensionByGender(singular: ['belo'], plural: ['bela']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['beli'], plural: ['bele']),
      feminine: new DeclensionByGender(singular: ['belu'], plural: ['bele']),
      neuter: new DeclensionByGender(singular: ['belo'], plural: ['bela']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['belim'], plural: ['belima']),
      feminine: new DeclensionByGender(singular: ['belom'], plural: ['belima']),
      neuter: new DeclensionByGender(singular: ['belim'], plural: ['belima']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['belom'], plural: ['belima']),
      feminine: new DeclensionByGender(singular: ['beloj'], plural: ['belima']),
      neuter: new DeclensionByGender(singular: ['belom'], plural: ['belima']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: ['belog'], plural: ['belih']),
      feminine: new DeclensionByGender(singular: ['bele'], plural: ['belih']),
      neuter: new DeclensionByGender(singular: ['belog'], plural: ['belih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
}
