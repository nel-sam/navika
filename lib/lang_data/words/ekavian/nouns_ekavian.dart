import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

class NounsEkavian {
  static final Noun mesto = Noun(
    dictionary: 'mesto',
    tags: [Tags.Season, Tags.Weather],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['mesto'], plural: ['mesta']),
    genitiv: new DeclensionByCount(singular: ['mesta'], plural: ['mesta']),
    dativ: new DeclensionByCount(singular: ['mestu'], plural: ['mestima']),
    akuzativ: new DeclensionByCount(singular: ['mesto'], plural: ['mesta']),
    lokativ: new DeclensionByCount(singular: ['mestu'], plural: ['mestima']),
    vokativ: new DeclensionByCount(singular: ['mesto'], plural: ['mesta']),
    instrumental:
        new DeclensionByCount(singular: ['mestom'], plural: ['mestima']),
  );

  static final Noun kafa = Noun(
    dictionary: 'kafa',
    tags: [Tags.Food, Tags.Drink],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['kafa'], plural: ['kafe']),
    akuzativ: new DeclensionByCount(singular: ['kafu'], plural: ['kafe']),
    instrumental:
        new DeclensionByCount(singular: ['kafom'], plural: ['kafama']),
    lokativ: new DeclensionByCount(singular: ['kafi'], plural: ['kafama']),
    dativ: new DeclensionByCount(singular: ['kafi'], plural: ['kafama']),
    genitiv: new DeclensionByCount(singular: ['kafe'], plural: ['kafa']),
    vokativ: new DeclensionByCount(singular: ['kafo'], plural: ['kafe']),
  );

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
    dativ: new DeclensionByCount(singular: ['čoveku'], plural: ['']),
    akuzativ: new DeclensionByCount(singular: ['čoveka'], plural: ['']),
    lokativ: new DeclensionByCount(singular: ['čoveku'], plural: ['']),
    vokativ: new DeclensionByCount(singular: ['čoveče'], plural: ['']),
    instrumental: new DeclensionByCount(singular: ['čovekom'], plural: ['']),
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

  static final Noun mesec = Noun(
    dictionary: 'mesec',
    tags: [Tags.Time, Tags.Concept],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['mesec'], plural: ['meseci']),
    genitiv: new DeclensionByCount(singular: ['meseca'], plural: ['meseci']),
    dativ: new DeclensionByCount(singular: ['mesecu'], plural: ['mesecima']),
    akuzativ: new DeclensionByCount(singular: ['mesec'], plural: ['meseci']),
    lokativ: new DeclensionByCount(singular: ['mesecu'], plural: ['mesecima']),
    vokativ: new DeclensionByCount(singular: ['mesecu'], plural: ['meseci']),
    instrumental:
        new DeclensionByCount(singular: ['mesecom'], plural: ['mesecima']),
  );
}
