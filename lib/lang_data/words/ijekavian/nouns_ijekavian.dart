import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

class NounsIjekavian {
  static final Noun zrakoplov = Noun(
    dictionary: 'zrakoplov',
    tags: [Tags.Vehicle],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ:
        new DeclensionByCount(singular: ['zrakoplov'], plural: ['zrakoplovi']),
    genitiv:
        new DeclensionByCount(singular: ['zrakoplova'], plural: ['zrakoplova']),
    dativ: new DeclensionByCount(
        singular: ['zrakoplovu'], plural: ['zrakoplovima']),
    akuzativ:
        new DeclensionByCount(singular: ['zrakoplov'], plural: ['zrakoplove']),
    lokativ: new DeclensionByCount(
        singular: ['zrakoplovu'], plural: ['zrakoplovima']),
    vokativ:
        new DeclensionByCount(singular: ['zrakoplove'], plural: ['zrakoplovi']),
    instrumental: new DeclensionByCount(
        singular: ['zrakoplovom'], plural: ['zrakoplovima']),
  );

  static final Noun djevojka = Noun(
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
  );
  static final Noun ljeto = Noun(
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
  );
}
