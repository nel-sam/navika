import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/utilities/navika-helpers.dart';

class NounBankGeneral {
  static final Noun selo = Noun(
    dictionary: 'selo',
    tags: [Tags.Location, Tags.NaturalFeature],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['selo'], plural: ['sela']),
    genitiv: new DeclensionByCount(singular: ['sela'], plural: ['sela']),
    dativ: new DeclensionByCount(singular: ['selu'], plural: ['selima']),
    akuzativ: new DeclensionByCount(singular: ['selo'], plural: ['sela']),
    lokativ: new DeclensionByCount(singular: ['selu'], plural: ['selima']),
    vokativ: new DeclensionByCount(singular: ['selo'], plural: ['sela']),
    instrumental:
        new DeclensionByCount(singular: ['selom'], plural: ['selima']),
  );

  static final Noun more = Noun(
    dictionary: 'more',
    tags: [Tags.Location, Tags.NaturalFeature],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['more'], plural: ['mora']),
    genitiv: new DeclensionByCount(singular: ['mora'], plural: ['mora']),
    dativ: new DeclensionByCount(singular: ['moru'], plural: ['morima']),
    akuzativ: new DeclensionByCount(singular: ['more'], plural: ['mora']),
    lokativ: new DeclensionByCount(singular: ['moru'], plural: ['morima']),
    vokativ: new DeclensionByCount(singular: ['moro'], plural: ['mora']),
    instrumental:
        new DeclensionByCount(singular: ['morem'], plural: ['morima']),
  );

  static final Noun pravilo = Noun(
    dictionary: 'pravilo',
    tags: [],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ:
        new DeclensionByCount(singular: ['pravilo'], plural: ['pravila']),
    genitiv: new DeclensionByCount(singular: ['pravila'], plural: ['pravila']),
    dativ: new DeclensionByCount(singular: ['pravilu'], plural: ['pravilima']),
    akuzativ: new DeclensionByCount(singular: ['pravilo'], plural: ['pravila']),
    lokativ:
        new DeclensionByCount(singular: ['pravilu'], plural: ['pravilima']),
    vokativ: new DeclensionByCount(singular: ['pravilo'], plural: ['pravila']),
    instrumental:
        new DeclensionByCount(singular: ['pravilom'], plural: ['pravilima']),
  );

  static final Noun slon = Noun(
    dictionary: 'slon',
    tags: [Tags.Animal],
    gender: Genders.Masculine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['slon'], plural: ['slonovi']),
    genitiv: new DeclensionByCount(singular: ['slona'], plural: ['slona']),
    dativ: new DeclensionByCount(singular: ['slonu'], plural: ['slonovima']),
    akuzativ: new DeclensionByCount(singular: ['slon'], plural: ['slone']),
    lokativ: new DeclensionByCount(singular: ['slonu'], plural: ['slonovima']),
    vokativ: new DeclensionByCount(singular: ['slone'], plural: ['slonovi']),
    instrumental:
        new DeclensionByCount(singular: ['slonom'], plural: ['slonovima']),
  );

  static final Noun jezero = Noun(
    dictionary: 'jezero',
    tags: [Tags.Location, Tags.NaturalFeature],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['jezero'], plural: ['jezera']),
    genitiv: new DeclensionByCount(singular: ['jezera'], plural: ['jezera']),
    dativ: new DeclensionByCount(singular: ['jezeru'], plural: ['jezerima']),
    akuzativ: new DeclensionByCount(singular: ['jezero'], plural: ['jezera']),
    lokativ: new DeclensionByCount(singular: ['jezeru'], plural: ['jezerima']),
    vokativ: new DeclensionByCount(singular: ['jezero'], plural: ['jezera']),
    instrumental:
        new DeclensionByCount(singular: ['jezerom'], plural: ['jezerima']),
  );

  static final Noun ruka = Noun(
    dictionary: 'ruka',
    tags: [Tags.Food, Tags.Portable],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['ruka'], plural: ['ruke']),
    genitiv: new DeclensionByCount(singular: ['ruke'], plural: ['ruka']),
    dativ: new DeclensionByCount(singular: ['ruci'], plural: ['rukama']),
    akuzativ: new DeclensionByCount(singular: ['ruku'], plural: ['ruke']),
    lokativ: new DeclensionByCount(singular: ['ruci'], plural: ['rukama']),
    vokativ: new DeclensionByCount(singular: ['ruko'], plural: ['ruke']),
    instrumental:
        new DeclensionByCount(singular: ['rukom'], plural: ['rukama']),
  );

  static final Noun meso = Noun(
    dictionary: 'meso',
    tags: [Tags.Drink, Tags.Alcohol, Tags.Thing, Tags.Portable],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['meso'], plural: ['mesa']),
    genitiv: new DeclensionByCount(singular: ['mesa'], plural: ['mesa']),
    dativ: new DeclensionByCount(singular: ['mesu'], plural: ['mesima']),
    akuzativ: new DeclensionByCount(singular: ['meso'], plural: ['mesa']),
    lokativ: new DeclensionByCount(singular: ['mesu'], plural: ['mesima']),
    vokativ: new DeclensionByCount(singular: ['meso'], plural: ['mesa']),
    instrumental:
        new DeclensionByCount(singular: ['mesom'], plural: ['mesima']),
  );

  static final Noun poklon = Noun(
    dictionary: 'poklon',
    tags: [],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['poklon'], plural: ['pokloni']),
    genitiv: new DeclensionByCount(singular: ['poklona'], plural: ['poklona']),
    dativ: new DeclensionByCount(singular: ['poklonu'], plural: ['poklonima']),
    akuzativ: new DeclensionByCount(singular: ['poklon'], plural: ['poklone']),
    lokativ:
        new DeclensionByCount(singular: ['poklonu'], plural: ['poklonima']),
    vokativ: new DeclensionByCount(singular: ['poklone'], plural: ['pokloni']),
    instrumental:
        new DeclensionByCount(singular: ['poklonom'], plural: ['poklonima']),
  );

  static final Noun grad = Noun(
    dictionary: 'grad',
    tags: [Tags.Location],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['grad'], plural: ['gradovi']),
    genitiv: new DeclensionByCount(singular: ['grada'], plural: ['gradova']),
    dativ: new DeclensionByCount(singular: ['gradu'], plural: ['gradovima']),
    akuzativ: new DeclensionByCount(singular: ['grad'], plural: ['gradove']),
    lokativ: new DeclensionByCount(singular: ['gradu'], plural: ['gradovima']),
    vokativ: new DeclensionByCount(singular: ['grade'], plural: ['gradi']),
    instrumental:
        new DeclensionByCount(singular: ['gradom'], plural: ['gradovima']),
  );

  static final Noun centar = Noun(
    dictionary: 'centar',
    tags: [],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['centar'], plural: ['centri']),
    genitiv: new DeclensionByCount(singular: ['centra'], plural: ['centara']),
    dativ: new DeclensionByCount(singular: ['centru'], plural: ['centrima']),
    akuzativ: new DeclensionByCount(singular: ['centar'], plural: ['centre']),
    lokativ: new DeclensionByCount(singular: ['centru'], plural: ['centrima']),
    vokativ: new DeclensionByCount(singular: ['centre'], plural: ['centri']),
    instrumental:
        new DeclensionByCount(singular: ['centrom'], plural: ['centrima']),
  );

  static final Noun caj = Noun(
    dictionary: 'čaj',
    tags: [],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['čaj'], plural: ['čajevi']),
    genitiv: new DeclensionByCount(singular: ['čaja'], plural: ['čajeva']),
    dativ: new DeclensionByCount(singular: ['čaju'], plural: ['čajevima']),
    akuzativ: new DeclensionByCount(singular: ['čaja'], plural: ['čajeve']),
    lokativ: new DeclensionByCount(singular: ['čaju'], plural: ['čajevima']),
    vokativ: new DeclensionByCount(singular: ['čaju'], plural: ['čajevi']),
    instrumental:
        new DeclensionByCount(singular: ['čajem'], plural: ['čajevima']),
  );

  static final Noun pekara = Noun(
    dictionary: 'pekara',
    tags: [Tags.Food, Tags.Portable],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['pekara'], plural: ['pekare']),
    genitiv: new DeclensionByCount(singular: ['pekare'], plural: ['pekara']),
    dativ: new DeclensionByCount(singular: ['pekari'], plural: ['pekarama']),
    akuzativ: new DeclensionByCount(singular: ['pekaru'], plural: ['pekare']),
    lokativ: new DeclensionByCount(singular: ['pekari'], plural: ['pekarama']),
    vokativ: new DeclensionByCount(singular: ['pekaro'], plural: ['pekare']),
    instrumental:
        new DeclensionByCount(singular: ['pekarom'], plural: ['pekarama']),
  );

  static final Noun zivot = Noun(
    dictionary: 'život',
    tags: [],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['život'], plural: ['životi']),
    genitiv: new DeclensionByCount(singular: ['života'], plural: ['života']),
    dativ: new DeclensionByCount(singular: ['životu'], plural: ['životima']),
    akuzativ: new DeclensionByCount(singular: ['života'], plural: ['živote']),
    lokativ: new DeclensionByCount(singular: ['životu'], plural: ['životima']),
    vokativ: new DeclensionByCount(singular: ['živote'], plural: ['životi']),
    instrumental:
        new DeclensionByCount(singular: ['životom'], plural: ['životima']),
  );

  static final Noun torta = Noun(
    dictionary: 'torta',
    tags: [Tags.Food, Tags.Portable],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['torta'], plural: ['torte']),
    genitiv: new DeclensionByCount(singular: ['torte'], plural: ['torta']),
    dativ: new DeclensionByCount(singular: ['torti'], plural: ['tortama']),
    akuzativ: new DeclensionByCount(singular: ['tortu'], plural: ['torte']),
    lokativ: new DeclensionByCount(singular: ['torti'], plural: ['tortama']),
    vokativ: new DeclensionByCount(singular: ['torto'], plural: ['torte']),
    instrumental:
        new DeclensionByCount(singular: ['tortom'], plural: ['tortama']),
  );

  static final Noun ananas = Noun(
    dictionary: 'ananas',
    tags: [Tags.Food, Tags.Portable],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['ananas'], plural: ['ananasi']),
    genitiv: new DeclensionByCount(singular: ['ananasa'], plural: ['ananasa']),
    dativ: new DeclensionByCount(singular: ['ananasu'], plural: ['ananasima']),
    akuzativ: new DeclensionByCount(singular: ['ananas'], plural: ['ananase']),
    lokativ:
        new DeclensionByCount(singular: ['ananasu'], plural: ['ananasima']),
    vokativ: new DeclensionByCount(singular: ['ananase'], plural: ['ananasi']),
    instrumental:
        new DeclensionByCount(singular: ['ananasom'], plural: ['ananasima']),
  );

  static final Noun francuska = Noun(
    dictionary: 'Francuska',
    tags: [Tags.Location, Tags.Country],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['Francuska'], plural: ['']),
    genitiv: new DeclensionByCount(singular: ['Francuske'], plural: ['']),
    dativ: new DeclensionByCount(singular: ['Francuskoj'], plural: ['']),
    akuzativ: new DeclensionByCount(singular: ['Francusku'], plural: ['']),
    lokativ: new DeclensionByCount(singular: ['Francuskoj'], plural: ['']),
    vokativ: new DeclensionByCount(singular: ['Francuska'], plural: ['']),
    instrumental: new DeclensionByCount(singular: ['Francuskom'], plural: ['']),
  );

  static final Noun bosna = Noun(
    dictionary: 'Bosna',
    tags: [Tags.Location, Tags.Country],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['Bosna'], plural: ['']),
    genitiv: new DeclensionByCount(singular: ['Bosne'], plural: ['']),
    dativ: new DeclensionByCount(singular: ['Bosni'], plural: ['']),
    akuzativ: new DeclensionByCount(singular: ['Bosnu'], plural: ['']),
    lokativ: new DeclensionByCount(singular: ['Bosni'], plural: ['']),
    vokativ: new DeclensionByCount(singular: ['Bosno'], plural: ['']),
    instrumental: new DeclensionByCount(singular: ['Bosnom'], plural: ['']),
  );

  static final Noun srbija = Noun(
    dictionary: 'Srbija',
    tags: [Tags.Location, Tags.Country],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['Srbija'], plural: ['']),
    genitiv: new DeclensionByCount(singular: ['Srbije'], plural: ['']),
    dativ: new DeclensionByCount(singular: ['Srbiji'], plural: ['']),
    akuzativ: new DeclensionByCount(singular: ['Srbiju'], plural: ['']),
    lokativ: new DeclensionByCount(singular: ['Srbiji'], plural: ['']),
    vokativ:
        new DeclensionByCount(singular: ['Srbijo', 'Srbija'], plural: ['']),
    instrumental: new DeclensionByCount(singular: ['Srbijom'], plural: ['']),
  );

  static final Noun lice = Noun(
    dictionary: 'lice',
    tags: [Tags.BodyPart],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['lice'], plural: ['lica']),
    genitiv: new DeclensionByCount(singular: ['lica'], plural: ['lica']),
    dativ: new DeclensionByCount(singular: ['licu'], plural: ['licima']),
    akuzativ: new DeclensionByCount(singular: ['lice'], plural: ['lica']),
    lokativ: new DeclensionByCount(singular: ['licu'], plural: ['licima']),
    vokativ: new DeclensionByCount(singular: ['lice'], plural: ['lica']),
    instrumental:
        new DeclensionByCount(singular: ['licem'], plural: ['licima']),
  );

  static final Noun zena = Noun(
    dictionary: 'žena',
    tags: [Tags.Human, Tags.Adult],
    gender: Genders.Feminine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['žena'], plural: ['žene']),
    akuzativ: new DeclensionByCount(singular: ['ženu'], plural: ['žene']),
    instrumental:
        new DeclensionByCount(singular: ['ženom'], plural: ['ženama']),
    lokativ: new DeclensionByCount(singular: ['ženi'], plural: ['ženama']),
    dativ: new DeclensionByCount(singular: ['ženi'], plural: ['ženama']),
    genitiv: new DeclensionByCount(singular: ['žene'], plural: ['žena']),
    vokativ: new DeclensionByCount(singular: ['ženo'], plural: ['žene']),
  );

  static final Noun sestra = Noun(
    dictionary: 'sestra',
    tags: [Tags.Human, Tags.Adult],
    gender: Genders.Feminine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['sestra'], plural: ['sestre']),
    akuzativ: new DeclensionByCount(singular: ['sestru'], plural: ['sestre']),
    instrumental:
        new DeclensionByCount(singular: ['sestrom'], plural: ['sestrama']),
    lokativ: new DeclensionByCount(singular: ['sestri'], plural: ['sestrama']),
    dativ: new DeclensionByCount(singular: ['sestri'], plural: ['sestrama']),
    genitiv: new DeclensionByCount(singular: ['sestre'], plural: ['sestara']),
    vokativ: new DeclensionByCount(singular: ['sestro'], plural: ['sestre']),
  );

  static final Noun majka = Noun(
    dictionary: 'majka',
    tags: [Tags.Human, Tags.Adult],
    gender: Genders.Feminine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['majka'], plural: ['majke']),
    akuzativ: new DeclensionByCount(singular: ['majku'], plural: ['majke']),
    instrumental:
        new DeclensionByCount(singular: ['majkom'], plural: ['majkama']),
    lokativ: new DeclensionByCount(singular: ['majci'], plural: ['majkama']),
    genitiv: new DeclensionByCount(singular: ['majke'], plural: ['majka']),
    vokativ: new DeclensionByCount(singular: ['majko'], plural: ['majke']),
  );

  static final Noun bratBraca = Noun(
    dictionary: 'brat/braća',
    extraInfo: N.t('extrainfo_brat'),
    tags: [Tags.Human, Tags.Adult],
    gender: Genders.Masculine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['brat'], plural: ['braća']),
    akuzativ: new DeclensionByCount(singular: ['brata'], plural: ['braću']),
    instrumental:
        new DeclensionByCount(singular: ['bratom'], plural: ['braćom']),
    lokativ: new DeclensionByCount(singular: ['bratu'], plural: ['braći']),
    dativ: new DeclensionByCount(singular: ['bratu'], plural: ['braći']),
    genitiv: new DeclensionByCount(singular: ['brata'], plural: ['braće']),
    vokativ: new DeclensionByCount(singular: ['brate'], plural: ['braćo']),
  );

  static final Noun muskarac = Noun(
    dictionary: 'muškarac',
    tags: [Tags.Human, Tags.Adult],
    gender: Genders.Masculine,
    isAnimate: true,
    nominativ:
        new DeclensionByCount(singular: ['muškarac'], plural: ['muškarci']),
    akuzativ:
        new DeclensionByCount(singular: ['muškarca'], plural: ['muškarce']),
    instrumental:
        new DeclensionByCount(singular: ['muškarcem'], plural: ['muškarcima']),
    lokativ:
        new DeclensionByCount(singular: ['muškarcu'], plural: ['muškarcima']),
    dativ:
        new DeclensionByCount(singular: ['muškarcu'], plural: ['muškarcima']),
    genitiv:
        new DeclensionByCount(singular: ['muškarca'], plural: ['muškaraca']),
    vokativ:
        new DeclensionByCount(singular: ['muškarče'], plural: ['muškarci']),
  );

  static final Noun otac = Noun(
    dictionary: 'otac',
    tags: [Tags.Human, Tags.Adult],
    gender: Genders.Masculine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['otac'], plural: ['očevi']),
    akuzativ: new DeclensionByCount(singular: ['oca'], plural: ['očeve']),
    instrumental:
        new DeclensionByCount(singular: ['ocem'], plural: ['očevima']),
    lokativ: new DeclensionByCount(singular: ['ocu'], plural: ['očevima']),
    dativ: new DeclensionByCount(singular: ['ocu'], plural: ['očevima']),
    genitiv: new DeclensionByCount(singular: ['oca'], plural: ['očeva']),
    vokativ: new DeclensionByCount(singular: ['oče'], plural: ['očevi']),
  );

  static final Noun sin = Noun(
    dictionary: 'sin',
    tags: [Tags.Human],
    gender: Genders.Masculine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['sin'], plural: ['sinovi']),
    genitiv: new DeclensionByCount(singular: ['sina'], plural: ['sinova']),
    dativ: new DeclensionByCount(singular: ['sinu'], plural: ['sinovima']),
    akuzativ: new DeclensionByCount(singular: ['sina'], plural: ['sinove']),
    lokativ: new DeclensionByCount(singular: ['sinu'], plural: ['sinovima']),
    vokativ: new DeclensionByCount(singular: ['sine'], plural: ['sinovi']),
    instrumental:
        new DeclensionByCount(singular: ['sinom'], plural: ['sinovima']),
  );

  static final Noun ljubav = Noun(
    dictionary: 'ljubav',
    tags: [Tags.Emotion],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['ljubav'], plural: ['ljubavi']),
    akuzativ: new DeclensionByCount(singular: ['ljubav'], plural: ['ljubavi']),
    instrumental:
        new DeclensionByCount(singular: ['ljubavi'], plural: ['ljubavima']),
    lokativ:
        new DeclensionByCount(singular: ['ljubavi'], plural: ['ljubavima']),
    dativ: new DeclensionByCount(singular: ['ljubavi'], plural: ['ljubavima']),
    genitiv: new DeclensionByCount(singular: ['ljubavi'], plural: ['ljubavi']),
    vokativ: new DeclensionByCount(singular: ['ljubavi'], plural: ['ljubavi']),
  );

  static final Noun telefon = Noun(
    dictionary: 'telefon',
    tags: [Tags.Portable, Tags.Thing],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ:
        new DeclensionByCount(singular: ['telefon'], plural: ['telefoni']),
    akuzativ:
        new DeclensionByCount(singular: ['telefon'], plural: ['telefone']),
    instrumental:
        new DeclensionByCount(singular: ['telefonom'], plural: ['telefonima']),
    lokativ:
        new DeclensionByCount(singular: ['telefonu'], plural: ['telefonima']),
    dativ:
        new DeclensionByCount(singular: ['telefonu'], plural: ['telefonima']),
    genitiv:
        new DeclensionByCount(singular: ['telefona'], plural: ['telefona']),
    vokativ: new DeclensionByCount(singular: [''], plural: ['']),
  );

  static final Noun knjiga = Noun(
    dictionary: 'knjiga',
    tags: [Tags.Portable, Tags.Thing],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['knjiga'], plural: ['knjige']),
    genitiv: new DeclensionByCount(singular: ['knjige'], plural: ['knjiga']),
    dativ: new DeclensionByCount(singular: ['knjizi'], plural: ['knjigama']),
    akuzativ: new DeclensionByCount(singular: ['knjigu'], plural: ['knjige']),
    lokativ: new DeclensionByCount(singular: ['knjizi'], plural: ['knjigama']),
    vokativ: new DeclensionByCount(singular: ['knjigo'], plural: ['knjige']),
    instrumental:
        new DeclensionByCount(singular: ['knjigom'], plural: ['knjigama']),
  );

  static final Noun proljece = Noun(
    dictionary: 'proljeće',
    tags: [Tags.Season, Tags.Weather],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ:
        new DeclensionByCount(singular: ['proljeće'], plural: ['proljeća']),
    genitiv:
        new DeclensionByCount(singular: ['proljeća'], plural: ['proljeća']),
    dativ:
        new DeclensionByCount(singular: ['proljeću'], plural: ['proljećima']),
    akuzativ:
        new DeclensionByCount(singular: ['proljeće'], plural: ['proljeća']),
    lokativ:
        new DeclensionByCount(singular: ['proljeću'], plural: ['proljećima']),
    vokativ:
        new DeclensionByCount(singular: ['proljeće'], plural: ['proljeća']),
    instrumental:
        new DeclensionByCount(singular: ['proljećem'], plural: ['proljećima']),
  );

  static final Noun jesen = Noun(
    dictionary: 'jesen',
    tags: [Tags.Season, Tags.Weather, Tags.Time],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['jesen'], plural: ['jeseni']),
    genitiv: new DeclensionByCount(singular: ['jeseni'], plural: ['jeseni']),
    dativ: new DeclensionByCount(singular: ['jeseni'], plural: ['jesenima']),
    akuzativ: new DeclensionByCount(singular: ['jesen'], plural: ['jeseni']),
    lokativ: new DeclensionByCount(singular: ['jeseni'], plural: ['jesenima']),
    vokativ: new DeclensionByCount(singular: ['jeseni'], plural: ['jesenima']),
    instrumental:
        new DeclensionByCount(singular: ['jeseni'], plural: ['jesenima']),
  );

  static final Noun zima = Noun(
    dictionary: 'zima',
    tags: [Tags.Season, Tags.Weather],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['zima'], plural: ['zime']),
    genitiv: new DeclensionByCount(singular: ['zime'], plural: ['zima']),
    dativ: new DeclensionByCount(singular: ['zimi'], plural: ['zimama']),
    akuzativ: new DeclensionByCount(singular: ['zimu'], plural: ['zime']),
    lokativ: new DeclensionByCount(singular: ['zimi'], plural: ['zimama']),
    vokativ: new DeclensionByCount(singular: ['zimo'], plural: ['zime']),
    instrumental:
        new DeclensionByCount(singular: ['zimom'], plural: ['zimama']),
  );

  static final Noun bolnica = Noun(
    dictionary: 'bolnica',
    tags: [Tags.Location, Tags.WorkPlace, Tags.Building],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ:
        new DeclensionByCount(singular: ['bolnica'], plural: ['bolnice']),
    genitiv: new DeclensionByCount(singular: ['bolnice'], plural: ['bolnica']),
    dativ: new DeclensionByCount(singular: ['bolnici'], plural: ['bolnicama']),
    akuzativ: new DeclensionByCount(singular: ['bolnicu'], plural: ['bolnice']),
    lokativ:
        new DeclensionByCount(singular: ['bolnici'], plural: ['bolnicama']),
    vokativ: new DeclensionByCount(singular: ['bolnico'], plural: ['bolnice']),
    instrumental:
        new DeclensionByCount(singular: ['bolnicom'], plural: ['bolnicama']),
  );

  static final Noun krevet = Noun(
    dictionary: 'krevet',
    tags: [Tags.FlatSurface, Tags.Furniture, Tags.Thing],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['krevet'], plural: ['kreveti']),
    genitiv: new DeclensionByCount(singular: ['kreveta'], plural: ['kreveta']),
    dativ: new DeclensionByCount(singular: ['krevetu'], plural: ['krevetima']),
    akuzativ: new DeclensionByCount(singular: ['krevet'], plural: ['krevete']),
    lokativ:
        new DeclensionByCount(singular: ['krevetu'], plural: ['krevetima']),
    vokativ: new DeclensionByCount(singular: ['krevete'], plural: ['kreveti']),
    instrumental:
        new DeclensionByCount(singular: ['krevetom'], plural: ['krevetima']),
  );

  static final Noun pas = Noun(
    dictionary: 'pas',
    tags: [Tags.Animal, Tags.Pet, Tags.Portable],
    gender: Genders.Masculine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['pas'], plural: ['psi']),
    genitiv: new DeclensionByCount(singular: ['psa'], plural: ['pasa']),
    dativ: new DeclensionByCount(singular: ['psu'], plural: ['psima']),
    akuzativ: new DeclensionByCount(singular: ['psa'], plural: ['pse']),
    lokativ: new DeclensionByCount(singular: ['psu'], plural: ['psima']),
    vokativ: new DeclensionByCount(singular: ['psu'], plural: ['psi']),
    instrumental: new DeclensionByCount(singular: ['psom'], plural: ['psima']),
  );

  static final Noun gitara = Noun(
    dictionary: 'gitara',
    tags: [Tags.Instrument, Tags.Thing, Tags.Portable],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['gitara'], plural: ['gitare']),
    genitiv: new DeclensionByCount(singular: ['gitare'], plural: ['gitara']),
    dativ: new DeclensionByCount(singular: ['gitari'], plural: ['gitarama']),
    akuzativ: new DeclensionByCount(singular: ['gitaru'], plural: ['gitare']),
    lokativ: new DeclensionByCount(singular: ['gitari'], plural: ['gitarama']),
    vokativ: new DeclensionByCount(singular: ['gitaro'], plural: ['gitare']),
    instrumental:
        new DeclensionByCount(singular: ['gitarom'], plural: ['gitarama']),
  );

  static final Noun pivo = Noun(
    dictionary: 'pivo',
    tags: [Tags.Drink, Tags.Alcohol, Tags.Thing, Tags.Portable],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['pivo'], plural: ['piva']),
    genitiv: new DeclensionByCount(singular: ['piva'], plural: ['piva']),
    dativ: new DeclensionByCount(singular: ['pivu'], plural: ['pivima']),
    akuzativ: new DeclensionByCount(singular: ['pivo'], plural: ['piva']),
    lokativ: new DeclensionByCount(singular: ['pivu'], plural: ['pivima']),
    vokativ: new DeclensionByCount(singular: ['pivo'], plural: ['piva']),
    instrumental:
        new DeclensionByCount(singular: ['pivom'], plural: ['pivima']),
  );

  static final Noun bolest = Noun(
    dictionary: 'bolest',
    tags: [Tags.Health],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['bolest'], plural: ['bolesti']),
    genitiv: new DeclensionByCount(singular: ['bolesti'], plural: ['bolesti']),
    dativ: new DeclensionByCount(singular: ['bolesti'], plural: ['bolestima']),
    akuzativ: new DeclensionByCount(singular: ['bolest'], plural: ['bolesti']),
    lokativ:
        new DeclensionByCount(singular: ['bolesti'], plural: ['bolestima']),
    vokativ: new DeclensionByCount(singular: ['bolesti'], plural: ['bolesti']),
    instrumental:
        new DeclensionByCount(singular: ['bolesti'], plural: ['bolestima']),
  );

  static final Noun bicikl = Noun(
    dictionary: 'bicikl',
    tags: [Tags.Vehicle, Tags.Portable, Tags.Thing],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['bicikl'], plural: ['bicikli']),
    genitiv: new DeclensionByCount(singular: ['bicikla'], plural: ['bicikla']),
    dativ: new DeclensionByCount(singular: ['biciklu'], plural: ['biciklima']),
    akuzativ: new DeclensionByCount(singular: ['bicikl'], plural: ['bicikle']),
    lokativ:
        new DeclensionByCount(singular: ['biciklu'], plural: ['biciklima']),
    vokativ: new DeclensionByCount(singular: ['bicikle'], plural: ['bicikli']),
    instrumental:
        new DeclensionByCount(singular: ['biciklom'], plural: ['biciklima']),
  );

  static final Noun godina = Noun(
    dictionary: 'godina',
    tags: [Tags.Time],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['godina'], plural: ['godine']),
    genitiv: new DeclensionByCount(singular: ['godine'], plural: ['godina']),
    dativ: new DeclensionByCount(singular: ['godini'], plural: ['godinama']),
    akuzativ: new DeclensionByCount(singular: ['godinu'], plural: ['godine']),
    lokativ: new DeclensionByCount(singular: ['godini'], plural: ['godinama']),
    vokativ: new DeclensionByCount(singular: ['godino'], plural: ['godine']),
    instrumental:
        new DeclensionByCount(singular: ['godinom'], plural: ['godinama']),
  );

  static final Noun kuca = Noun(
    dictionary: 'kuća',
    tags: [Tags.Thing, Tags.Location, Tags.Building],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['kuća'], plural: ['kuće']),
    genitiv: new DeclensionByCount(singular: ['kuće'], plural: ['kuća']),
    dativ: new DeclensionByCount(singular: ['kući'], plural: ['kućama']),
    akuzativ: new DeclensionByCount(singular: ['kuću'], plural: ['kuće']),
    lokativ: new DeclensionByCount(singular: ['kući'], plural: ['kućama']),
    vokativ: new DeclensionByCount(singular: ['kućo'], plural: ['kuće']),
    instrumental:
        new DeclensionByCount(singular: ['kućom'], plural: ['kućama']),
  );

  static final Noun macka = Noun(
    dictionary: 'mačka',
    tags: [Tags.Pet, Tags.Animal],
    gender: Genders.Feminine,
    isAnimate: true,
    nominativ: new DeclensionByCount(singular: ['mačka'], plural: ['mačke']),
    akuzativ: new DeclensionByCount(singular: ['mačku'], plural: ['mačke']),
    instrumental:
        new DeclensionByCount(singular: ['mačkom'], plural: ['mačkama']),
    lokativ: new DeclensionByCount(singular: ['mački'], plural: ['mačkama']),
    genitiv:
        new DeclensionByCount(singular: ['mačke'], plural: ['mačaka', 'mački']),
    vokativ: new DeclensionByCount(singular: ['mačko'], plural: ['mačke']),
  );

  static final Noun cesta = Noun(
    dictionary: 'cesta',
    tags: [Tags.FlatSurface, Tags.Location],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(singular: ['cesta'], plural: ['ceste']),
    genitiv: new DeclensionByCount(singular: ['ceste'], plural: ['cesta']),
    dativ: new DeclensionByCount(singular: ['cesti'], plural: ['cestama']),
    akuzativ: new DeclensionByCount(singular: ['cestu'], plural: ['ceste']),
    lokativ: new DeclensionByCount(singular: ['cesti'], plural: ['cestama']),
    vokativ: new DeclensionByCount(singular: ['cesto'], plural: ['ceste']),
    instrumental:
        new DeclensionByCount(singular: ['cestom'], plural: ['cestama']),
  );
}
