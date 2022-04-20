import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class DemonstrativePronouns {
  static final Adjective taj = Adjective(
    dictionary: 'taj',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['taj'], plural: ['ti']),
      feminine: new DeclensionByGender(singular: ['ta'], plural: ['te']),
      neuter: new DeclensionByGender(singular: ['to'], plural: ['ta']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['taj'], plural: ['ta']),
      feminine: new DeclensionByGender(singular: ['tu'], plural: ['te']),
      neuter: new DeclensionByGender(singular: ['to'], plural: ['ti']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['time', 'tim'], plural: ['tim']),
      feminine: new DeclensionByGender(singular: ['tom'], plural: ['tim']),
      neuter:
          new DeclensionByGender(singular: ['time', 'tim'], plural: ['tim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tomu', 'tome', 'tom'], plural: ['tim']),
      feminine: new DeclensionByGender(singular: ['toj'], plural: ['tim']),
      neuter: new DeclensionByGender(
          singular: ['tomu', 'tome', 'tom'], plural: ['tim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tomu', 'tome', 'tom'], plural: ['tim']),
      feminine: new DeclensionByGender(singular: ['toj'], plural: ['tim']),
      neuter: new DeclensionByGender(
          singular: ['tomu', 'tome', 'tom'], plural: ['tim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['toga', 'tog'], plural: ['tih']),
      feminine: new DeclensionByGender(singular: ['te'], plural: ['tih']),
      neuter:
          new DeclensionByGender(singular: ['toga', 'tog'], plural: ['tih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
  static final Adjective onaj = Adjective(
    dictionary: 'onaj',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['onaj'], plural: ['oni']),
      feminine: new DeclensionByGender(singular: ['ona'], plural: ['one']),
      neuter: new DeclensionByGender(singular: ['ono'], plural: ['ona']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['onaj'], plural: ['one']),
      feminine: new DeclensionByGender(singular: ['onu'], plural: ['one']),
      neuter: new DeclensionByGender(singular: ['ono'], plural: ['ona']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['onime', 'onim'], plural: ['onim']),
      feminine: new DeclensionByGender(singular: ['onom'], plural: ['onim']),
      neuter:
          new DeclensionByGender(singular: ['onime', 'onim'], plural: ['onim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['onome', 'onomu', 'onom'], plural: ['onim']),
      feminine: new DeclensionByGender(singular: ['onoj'], plural: ['onim']),
      neuter: new DeclensionByGender(
          singular: ['onome', 'onomu', 'onom'], plural: ['onim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['onome', 'onomu', 'onom'], plural: ['onim']),
      feminine: new DeclensionByGender(singular: ['onoj'], plural: ['onim']),
      neuter: new DeclensionByGender(
          singular: ['onome', 'onomu', 'onom'], plural: ['onim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['onoga', 'onog'], plural: ['onih']),
      feminine: new DeclensionByGender(singular: ['one'], plural: ['onih']),
      neuter:
          new DeclensionByGender(singular: ['onoga', 'onog'], plural: ['onih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );

  static final Adjective svaki = Adjective(
    dictionary: 'svaki',
    toAvoid: [Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['svaki'], plural: ['svaki']),
      feminine: new DeclensionByGender(singular: ['svaka'], plural: ['svake']),
      neuter: new DeclensionByGender(singular: ['svako'], plural: ['svaka']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['svaki'], plural: ['svake']),
      feminine: new DeclensionByGender(singular: ['svaku'], plural: ['svake']),
      neuter: new DeclensionByGender(singular: ['svako'], plural: ['svaka']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['svakim'], plural: ['svakim']),
      feminine:
          new DeclensionByGender(singular: ['svakom'], plural: ['svakim']),
      neuter: new DeclensionByGender(singular: ['svakim'], plural: ['svakim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['svakim'], plural: ['svakim']),
      feminine:
          new DeclensionByGender(singular: ['svakoj'], plural: ['svakim']),
      neuter: new DeclensionByGender(singular: ['svakim'], plural: ['svakim']),
    ),
    dativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['svakim'], plural: ['svakim']),
      feminine:
          new DeclensionByGender(singular: ['svakoj'], plural: ['svakim']),
      neuter: new DeclensionByGender(singular: ['svakim'], plural: ['svakim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['svakoga', 'svakog'], plural: ['svakih']),
      feminine: new DeclensionByGender(singular: ['svake'], plural: ['svakih']),
      neuter: new DeclensionByGender(
          singular: ['svakoga', 'svakog'], plural: ['svakih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
}
