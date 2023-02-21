import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

class NounsEkavian {
  // Šta is not a noun but the Noun class best represents it
  static final Noun sta = Noun(
    dictionary: 'šta',
    tags: [Tags.FlatSurface, Tags.Furniture, Tags.Portable],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['šta'], plural: ['šta']),
    akuzativ: new DeclensionByCount(singular: ['šta'], plural: ['šta']),
    instrumental: new DeclensionByCount(singular: ['čime'], plural: ['čime']),
    lokativ: new DeclensionByCount(singular: ['čemu'], plural: ['čemu']),
    dativ: new DeclensionByCount(singular: ['čemu'], plural: ['čemu']),
    genitiv: new DeclensionByCount(singular: ['čega'], plural: ['čega']),
    vokativ: new DeclensionByCount(singular: [''], plural: ['']),
  );

  static final Noun covek = Noun(
    dictionary: 'čovek',
    tags: [Tags.Human],
    gender: Genders.Masculine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['čoveka'], plural: ['']),
    genitiv: new DeclensionByCount(singular: ['čoveka'], plural: ['']),
    dativ: new DeclensionByCount(singular: ['čoveki'], plural: ['']),
    akuzativ: new DeclensionByCount(singular: ['čoveku'], plural: ['']),
    lokativ: new DeclensionByCount(singular: ['čoveki'], plural: ['']),
    vokativ: new DeclensionByCount(singular: ['čoveko'], plural: ['']),
    instrumental:
        new DeclensionByCount(singular: ['čovekom'], plural: ['čovekama']),
  );

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
