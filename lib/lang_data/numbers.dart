import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';

final List<Adjective> cardinalNumbersBank = [
  Adjective(
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
          neuter: DeclensionByGender(singular: ['jedno'], plural: ['jedna']))),
  Adjective(
    dictionary: 'dva',
    nominativ: Declension(
      masculine: DeclensionByGender(singular: ['dva']),
      feminine: DeclensionByGender(singular: ['dve', 'dvije']),
      neuter: DeclensionByGender(singular: ['dva']),
    ),
    akuzativ: Declension(
      masculine: DeclensionByGender(singular: ['dva']),
      feminine: DeclensionByGender(singular: ['dve', 'dvije']),
      neuter: DeclensionByGender(singular: ['dva']),
    ),
    instrumental: Declension(
      masculine: DeclensionByGender(singular: ['dvama']),
      feminine: DeclensionByGender(singular: ['dvema', 'dvjema']),
      neuter: DeclensionByGender(singular: ['dvama']),
    ),
    genitiv: Declension(
      masculine: DeclensionByGender(singular: ['dvaju']),
      feminine: DeclensionByGender(singular: ['dviju']),
      neuter: DeclensionByGender(singular: ['dvaju']),
    ),
  ),
  Adjective(
    dictionary: 'tri',
    nominativ: Declension(masculine: DeclensionByGender(singular: ['tri'])),
  ),
  Adjective(
    dictionary: 'četiri',
    nominativ: Declension(masculine: DeclensionByGender(singular: ['četiri'])),
  ),
  Adjective(
    dictionary: 'pet',
    nominativ: Declension(masculine: DeclensionByGender(singular: ['pet'])),
  ),
  Adjective(
    dictionary: 'šest',
    nominativ: Declension(masculine: DeclensionByGender(singular: ['šest'])),
  ),
  Adjective(
    dictionary: 'sedam',
    nominativ: Declension(masculine: DeclensionByGender(singular: ['sedam'])),
  ),
];
