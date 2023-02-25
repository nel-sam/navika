import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

// No short forms for genitive and locative

class DemonstrativePronouns {
  static final Adjective koji = Adjective(
    dictionary: 'koji',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['koji'], plural: ['koji']),
      feminine: new DeclensionByGender(singular: ['koja'], plural: ['koje']),
      neuter: new DeclensionByGender(singular: ['koje'], plural: ['koja']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['koji'], plural: ['koje']),
      feminine: new DeclensionByGender(singular: ['koju'], plural: ['koje']),
      neuter: new DeclensionByGender(singular: ['koje'], plural: ['koja']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['kojim'], plural: ['kojima']),
      feminine: new DeclensionByGender(singular: ['kojom'], plural: ['kojima']),
      neuter: new DeclensionByGender(singular: ['kojim'], plural: ['kojima']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['kojemu'], plural: ['kojima']),
      feminine: new DeclensionByGender(singular: ['kojoj'], plural: ['kojima']),
      neuter: new DeclensionByGender(singular: ['kojemu'], plural: ['kojima']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: ['kojem'], plural: ['tima']),
      feminine: new DeclensionByGender(singular: ['kojoj'], plural: ['kojima']),
      neuter: new DeclensionByGender(singular: ['kojem'], plural: ['kojima']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['kojega'], plural: ['kojih']),
      feminine: new DeclensionByGender(singular: ['koje'], plural: ['kojih']),
      neuter: new DeclensionByGender(singular: ['kojega'], plural: ['kojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );

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
          new DeclensionByGender(singular: ['time', 'tim'], plural: ['tima']),
      feminine: new DeclensionByGender(singular: ['tom'], plural: ['tima']),
      neuter:
          new DeclensionByGender(singular: ['time', 'tim'], plural: ['tima']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tomu', 'tome', 'tom'], plural: ['tima']),
      feminine: new DeclensionByGender(singular: ['toj'], plural: ['tima']),
      neuter: new DeclensionByGender(
          singular: ['tomu', 'tome', 'tom'], plural: ['tima']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tomu', 'tome', 'tom'], plural: ['tima']),
      feminine: new DeclensionByGender(singular: ['toj'], plural: ['tima']),
      neuter: new DeclensionByGender(
          singular: ['tomu', 'tome', 'tom'], plural: ['tima']),
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
      masculine: new DeclensionByGender(
          singular: ['onime', 'onim'], plural: ['onima']),
      feminine: new DeclensionByGender(singular: ['onom'], plural: ['onima']),
      neuter: new DeclensionByGender(
          singular: ['onime', 'onim'], plural: ['onima']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['onome', 'onomu', 'onom'], plural: ['onima']),
      feminine: new DeclensionByGender(singular: ['onoj'], plural: ['onima']),
      neuter: new DeclensionByGender(
          singular: ['onome', 'onomu', 'onom'], plural: ['onima']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['onome', 'onomu', 'onom'], plural: ['onima']),
      feminine: new DeclensionByGender(singular: ['onoj'], plural: ['onima']),
      neuter: new DeclensionByGender(
          singular: ['onome', 'onomu', 'onom'], plural: ['onima']),
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
          new DeclensionByGender(singular: ['svakim'], plural: ['svakima']),
      feminine:
          new DeclensionByGender(singular: ['svakom'], plural: ['svakima']),
      neuter: new DeclensionByGender(singular: ['svakim'], plural: ['svakima']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['svakim'], plural: ['svakima']),
      feminine:
          new DeclensionByGender(singular: ['svakoj'], plural: ['svakima']),
      neuter: new DeclensionByGender(singular: ['svakim'], plural: ['svakima']),
    ),
    dativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['svakim'], plural: ['svakima']),
      feminine:
          new DeclensionByGender(singular: ['svakoj'], plural: ['svakima']),
      neuter: new DeclensionByGender(singular: ['svakim'], plural: ['svakima']),
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
