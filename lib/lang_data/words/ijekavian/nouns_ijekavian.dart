import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

final List<Noun> nounsIjekavian = [
  Noun(
    dictionary: 'djevojka',
    tags: [Tags.Human],
    gender: Genders.Feminine,
    isAnimate: true,
    nominativ:
        new DeclensionByCount(singular: ['djevojka'], plural: ['djevojke']),
    genitiv:
        new DeclensionByCount(singular: ['djevojke'], plural: ['djevojaka']),
    dativ:
        new DeclensionByCount(singular: ['djevojci'], plural: ['djevojkama']),
    akuzativ:
        new DeclensionByCount(singular: ['djevojku'], plural: ['djevojke']),
    lokativ:
        new DeclensionByCount(singular: ['djevojci'], plural: ['djevojkama']),
    vokativ:
        new DeclensionByCount(singular: ['djevojko'], plural: ['djevojke']),
    instrumental:
        new DeclensionByCount(singular: ['djevojkom'], plural: ['djevojkama']),
  ),
  Noun(
    dictionary: 'ljeto',
    tags: [Tags.Season, Tags.Weather],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['ljeto'], plural: ['ljeta']),
    genitiv: new DeclensionByCount(singular: ['ljeta'], plural: ['ljeta']),
    dativ: new DeclensionByCount(singular: ['ljetu'], plural: ['ljetima']),
    akuzativ: new DeclensionByCount(singular: ['ljeto'], plural: ['ljeta']),
    lokativ: new DeclensionByCount(singular: ['ljetu'], plural: ['ljetima']),
    vokativ: new DeclensionByCount(singular: ['ljeto'], plural: ['ljeta']),
    instrumental:
        new DeclensionByCount(singular: ['ljetom'], plural: ['ljetima']),
  ),
];
