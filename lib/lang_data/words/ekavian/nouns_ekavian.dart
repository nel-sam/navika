import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

class NounsEkavian {
  static final Noun stol = Noun(
    dictionary: 'sto',
    tags: [Tags.FlatSurface, Tags.Furniture, Tags.Portable],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['sto'], plural: ['stolovi']),
    akuzativ: new DeclensionByCount(singular: ['sto'], plural: ['stolove']),
    instrumental:
        new DeclensionByCount(singular: ['stolom'], plural: ['stolovima']),
    lokativ: new DeclensionByCount(singular: ['stolu'], plural: ['stolovima']),
    dativ: new DeclensionByCount(singular: ['stolu'], plural: ['stolovima']),
    genitiv: new DeclensionByCount(singular: ['stola'], plural: ['stolova']),
    vokativ: new DeclensionByCount(singular: ['stole'], plural: ['stolovi']),
  );

  static final Noun avion = Noun(
    dictionary: 'avion',
    tags: [Tags.Vehicle],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['avion'], plural: ['avioni']),
    genitiv: new DeclensionByCount(singular: ['aviona'], plural: ['aviona']),
    dativ: new DeclensionByCount(singular: ['avionu'], plural: ['avionima']),
    akuzativ: new DeclensionByCount(singular: ['avion'], plural: ['avione']),
    lokativ: new DeclensionByCount(singular: ['avionu'], plural: ['avionima']),
    vokativ: new DeclensionByCount(singular: ['avione'], plural: ['avioni']),
    instrumental:
        new DeclensionByCount(singular: ['avionom'], plural: ['avionima']),
  );

  static final Noun devojka = Noun(
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
  );
  static final Noun leto = Noun(
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
  );
  // TODO: Add porodica/familija
}
