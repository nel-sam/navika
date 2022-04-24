import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

class NounsIjekavian {
  static final Noun stol = Noun(
    dictionary: 'stol',
    tags: [Tags.FlatSurface, Tags.Furniture, Tags.Portable],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['stol'], plural: ['stolovi']),
    akuzativ: new DeclensionByCount(singular: ['stol'], plural: ['stolove']),
    instrumental:
        new DeclensionByCount(singular: ['stolom'], plural: ['stolovima']),
    lokativ: new DeclensionByCount(singular: ['stolu'], plural: ['stolovima']),
    dativ: new DeclensionByCount(singular: ['stolu'], plural: ['stolovima']),
    genitiv: new DeclensionByCount(singular: ['stola'], plural: ['stolova']),
    vokativ: new DeclensionByCount(singular: ['stole'], plural: ['stolovi']),
  );
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
  static final Noun obitelj = Noun(
    dictionary: 'obitelj',
    tags: [Tags.Human, Tags.Group],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ:
        new DeclensionByCount(singular: ['obitelj'], plural: ['obitelji']),
    genitiv:
        new DeclensionByCount(singular: ['obitelji'], plural: ['obitelji']),
    dativ:
        new DeclensionByCount(singular: ['obitelji'], plural: ['obiteljima']),
    akuzativ:
        new DeclensionByCount(singular: ['obitelj'], plural: ['obitelji']),
    lokativ:
        new DeclensionByCount(singular: ['obitelji'], plural: ['obiteljima']),
    vokativ:
        new DeclensionByCount(singular: ['obitelji'], plural: ['obitelji']),
    instrumental: new DeclensionByCount(
        singular: ['obitelji', 'obitelju'], plural: ['obitelju']),
  );
}
