import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

final List<Noun> nounsIjekavian = [
  Noun(
    dictionary: 'devojka',
    tags: [Tags.Human],
    gender: Genders.Feminine,
    isAnimate: true,
    nominativ:
        new DeclensionByCount(singular: ['devojka'], plural: ['devojke']),
    genitiv: new DeclensionByCount(singular: ['devojke'], plural: ['devojaka']),
    dativ: new DeclensionByCount(singular: ['devojci'], plural: ['devojkama']),
    akuzativ: new DeclensionByCount(singular: ['devojku'], plural: ['devojke']),
    lokativ:
        new DeclensionByCount(singular: ['devojci'], plural: ['devojkama']),
    vokativ: new DeclensionByCount(singular: ['devojko'], plural: ['devojke']),
    instrumental:
        new DeclensionByCount(singular: ['devojkom'], plural: ['devojkama']),
  ),
  Noun(
    dictionary: 'leto',
    tags: [Tags.Season, Tags.Weather],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['leto'], plural: ['leta']),
    genitiv: new DeclensionByCount(singular: ['leta'], plural: ['leta']),
    dativ: new DeclensionByCount(singular: ['letu'], plural: ['letima']),
    akuzativ: new DeclensionByCount(singular: ['leto'], plural: ['leta']),
    lokativ: new DeclensionByCount(singular: ['letu'], plural: ['letima']),
    vokativ: new DeclensionByCount(singular: ['leto'], plural: ['leta']),
    instrumental:
        new DeclensionByCount(singular: ['letom'], plural: ['letima']),
  ),
];
