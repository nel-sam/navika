import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';

class CardinalNumbersBank {
  static final Adjective jedan = Adjective(
    dictionary: 'jedan',
    nominativ: Declension(
        masculine: DeclensionByGender(singular: ['jedni'], plural: ['jedni']),
        feminine: DeclensionByGender(singular: ['jedna'], plural: ['jedne']),
        neuter: DeclensionByGender(singular: ['jedno'], plural: ['jedna'])),
    akuzativ: Declension(
        masculine: DeclensionByGender(singular: ['jedni'], plural: ['jedne']),
        feminine: DeclensionByGender(singular: ['jednu'], plural: ['jedne']),
        neuter: DeclensionByGender(singular: ['jedno'], plural: ['jedna'])),
    instrumental: Declension(
        masculine: DeclensionByGender(
            singular: ['jednim'], plural: ['jednim', 'jednima']),
        feminine: DeclensionByGender(
            singular: ['jednom'], plural: ['jednim', 'jednima']),
        neuter: DeclensionByGender(
            singular: ['jednim'], plural: ['jednim', 'jednima'])),
    lokativ: Declension(
        masculine: DeclensionByGender(
            singular: ['jednom', 'jednome', 'jednomu'],
            plural: ['jednim', 'jednima']),
        feminine: DeclensionByGender(
            singular: ['jednoj'], plural: ['jednim', 'jednima']),
        neuter: DeclensionByGender(
            singular: ['jednom', 'jednome', 'jednomu'],
            plural: ['jednim', 'jednima'])),
    genitiv: Declension(
      masculine: DeclensionByGender(
          singular: ['jednog', 'jednoga'], plural: ['jednih']),
      feminine: DeclensionByGender(singular: ['jedne'], plural: ['jednih']),
      neuter: DeclensionByGender(
          singular: ['jednog', 'jednoga'], plural: ['jednih']),
    ),
    vokativ: Declension(
        masculine: DeclensionByGender(singular: ['jedni'], plural: ['jedni']),
        feminine: DeclensionByGender(singular: ['jedna'], plural: ['jedne']),
        neuter: DeclensionByGender(singular: ['jedno'], plural: ['jedna'])),
  );

  static final Adjective dva = Adjective(
    dictionary: 'dva',
    nominativ: Declension(
      masculine: DeclensionByGender(singular: ['dva'], plural: ['dva']),
      feminine: DeclensionByGender(
          singular: ['dve', 'dvije'], plural: ['dve', 'dvije']),
      neuter: DeclensionByGender(singular: ['dva'], plural: ['dva']),
    ),
    akuzativ: Declension(
      masculine: DeclensionByGender(singular: ['dva'], plural: ['dva']),
      feminine: DeclensionByGender(
          singular: ['dve', 'dvije'], plural: ['dve', 'dvije']),
      neuter: DeclensionByGender(singular: ['dva'], plural: ['dva']),
    ),
    instrumental: Declension(
      masculine: DeclensionByGender(singular: ['dvama'], plural: ['dvama']),
      feminine: DeclensionByGender(
          singular: ['dvema', 'dvjema'], plural: ['dvema', 'dvjema']),
      neuter: DeclensionByGender(singular: ['dvama'], plural: ['dvama']),
    ),
    genitiv: Declension(
      masculine: DeclensionByGender(singular: ['dvaju'], plural: ['dvaju']),
      feminine: DeclensionByGender(singular: ['dviju'], plural: ['dviju']),
      neuter: DeclensionByGender(singular: ['dvaju'], plural: ['dvaju']),
    ),
  );

  static final Adjective tri = Adjective(dictionary: 'tri');
  static final Adjective cetiri = Adjective(dictionary: 'četiri');
  static final Adjective pet = Adjective(dictionary: 'pet');
  static final Adjective sest = Adjective(dictionary: 'šest');
  static final Adjective sedam = Adjective(dictionary: 'sedam');
  static final Adjective osam = Adjective(dictionary: 'osam');
  static final Adjective devet = Adjective(dictionary: 'devet');
  static final Adjective deset = Adjective(dictionary: 'deset');
  static final Adjective jedanaest = Adjective(dictionary: 'jedanaest');
  static final Adjective dvanaest = Adjective(dictionary: 'dvanaest');
  static final Adjective trinaest = Adjective(dictionary: 'trinaest');
  static final Adjective cetrnaest = Adjective(dictionary: 'četrnaest');
  static final Adjective petnaest = Adjective(dictionary: 'petnaest');
  static final Adjective sesnaest = Adjective(dictionary: 'šesnaest');
  static final Adjective sedamnaest = Adjective(dictionary: 'sedamnaest');
  static final Adjective osamnaest = Adjective(dictionary: 'osamnaest');
  static final Adjective devetnaest = Adjective(dictionary: 'devetnaest');
  // 20 and above auto generated
}
