import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class AdjectiveBankGeneral {
  static final Adjective dugi = Adjective(
    dictionary: 'dug',
    toAvoid: [Tags.Season],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['dugi'], plural: ['dugi']),
      feminine: new DeclensionByGender(singular: ['duga'], plural: ['duge']),
      neuter: new DeclensionByGender(singular: ['dugo'], plural: ['duga']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['dugi'], plural: ['duge']),
      feminine: new DeclensionByGender(singular: ['dugu'], plural: ['duge']),
      neuter: new DeclensionByGender(singular: ['dugo'], plural: ['duga']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: ['dugim'], plural: ['dugim']),
      feminine: new DeclensionByGender(singular: ['dugom'], plural: ['dugim']),
      neuter: new DeclensionByGender(singular: ['dugim'], plural: ['dugim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['dugom'], plural: ['dugim']),
      feminine: new DeclensionByGender(singular: ['dugoj'], plural: ['dugim']),
      neuter: new DeclensionByGender(singular: ['dugom'], plural: ['dugim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: ['dugog'], plural: ['dugih']),
      feminine: new DeclensionByGender(singular: ['duge'], plural: ['dugih']),
      neuter: new DeclensionByGender(singular: ['dugog'], plural: ['dugih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );

  static final Adjective velik = Adjective(
    dictionary: 'velik',
    toAvoid: [Tags.Season],
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['veliki'], plural: ['veliki']),
      feminine:
          new DeclensionByGender(singular: ['velika'], plural: ['velike']),
      neuter: new DeclensionByGender(singular: ['veliko'], plural: ['velika']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['veliki'], plural: ['velike']),
      feminine:
          new DeclensionByGender(singular: ['veliku'], plural: ['velike']),
      neuter: new DeclensionByGender(singular: ['veliko'], plural: ['velika']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['velikim'], plural: ['velikim']),
      feminine:
          new DeclensionByGender(singular: ['velikom'], plural: ['velikim']),
      neuter:
          new DeclensionByGender(singular: ['velikim'], plural: ['velikim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['velikom'], plural: ['velikim']),
      feminine:
          new DeclensionByGender(singular: ['velikoj'], plural: ['velikim']),
      neuter:
          new DeclensionByGender(singular: ['velikom'], plural: ['velikim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['velikog'], plural: ['velikih']),
      feminine:
          new DeclensionByGender(singular: ['velike'], plural: ['velikih']),
      neuter:
          new DeclensionByGender(singular: ['velikog'], plural: ['velikih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
  static final Adjective nov = Adjective(
    dictionary: 'nov',
    toAvoid: [Tags.Season],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['novi'], plural: ['novi']),
      feminine: new DeclensionByGender(singular: ['nova'], plural: ['nove']),
      neuter: new DeclensionByGender(singular: ['novo'], plural: ['nova']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['novi'], plural: ['nove']),
      feminine: new DeclensionByGender(singular: ['novu'], plural: ['nove']),
      neuter: new DeclensionByGender(singular: ['novo'], plural: ['nova']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['novim'], plural: ['novima', 'novim']),
      feminine: new DeclensionByGender(
          singular: ['novom'], plural: ['novima', 'novim']),
      neuter: new DeclensionByGender(
          singular: ['novim'], plural: ['novima', 'novim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['novome', 'novomu', 'novom'], plural: ['novima', 'novim']),
      feminine:
          new DeclensionByGender(singular: ['novoj'], plural: ['novijoj']),
      neuter: new DeclensionByGender(
          singular: ['novome', 'novomu', 'novom'], plural: ['novima', 'novim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['novoga', 'novog'], plural: ['novih']),
      feminine: new DeclensionByGender(singular: ['nove'], plural: ['novih']),
      neuter: new DeclensionByGender(
          singular: ['novoga', 'novog'], plural: ['novih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['novi'], plural: ['novi']),
      feminine: new DeclensionByGender(singular: ['nova'], plural: ['nove']),
      neuter: new DeclensionByGender(singular: ['novo'], plural: ['nova']),
    ),
  );
  static final Adjective star = Adjective(
    dictionary: 'star',
    toAvoid: [Tags.Season],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['stari'], plural: ['stari']),
      feminine: new DeclensionByGender(singular: ['stara'], plural: ['stare']),
      neuter: new DeclensionByGender(singular: ['staro'], plural: ['stara']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['stari'], plural: ['stare']),
      feminine: new DeclensionByGender(singular: ['staru'], plural: ['stare']),
      neuter: new DeclensionByGender(singular: ['staro'], plural: ['stara']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['starim'], plural: ['starima', 'starim']),
      feminine: new DeclensionByGender(
          singular: ['starom'], plural: ['starima', 'starim']),
      neuter: new DeclensionByGender(
          singular: ['starim'], plural: ['starima', 'starim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['starome', 'staromu', 'starom'],
          plural: ['starima', 'starim']),
      feminine:
          new DeclensionByGender(singular: ['staroj'], plural: ['starijoj']),
      neuter: new DeclensionByGender(
          singular: ['starome', 'staromu', 'starom'],
          plural: ['starima', 'starim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['staroga', 'starog'], plural: ['starih']),
      feminine: new DeclensionByGender(singular: ['stare'], plural: ['starih']),
      neuter: new DeclensionByGender(
          singular: ['staroga', 'starog'], plural: ['starih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['stari'], plural: ['stari']),
      feminine: new DeclensionByGender(singular: ['stara'], plural: ['stare']),
      neuter: new DeclensionByGender(singular: ['staro'], plural: ['stara']),
    ),
  );

  static final Adjective hladan = Adjective(
    dictionary: 'hladan',
    toAvoid: [Tags.Human, Tags.Animal],
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['hladni'], plural: ['hladni']),
      feminine:
          new DeclensionByGender(singular: ['hladna'], plural: ['hladne']),
      neuter: new DeclensionByGender(singular: ['hladno'], plural: ['hladna']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['hladni'], plural: ['hladne']),
      feminine:
          new DeclensionByGender(singular: ['hladnu'], plural: ['hladne']),
      neuter: new DeclensionByGender(singular: ['hladno'], plural: ['hladna']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['hladnim'], plural: ['hladnim']),
      feminine:
          new DeclensionByGender(singular: ['hladnom'], plural: ['hladnim']),
      neuter:
          new DeclensionByGender(singular: ['hladnim'], plural: ['hladnim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['hladnom'], plural: ['hladnim']),
      feminine:
          new DeclensionByGender(singular: ['hladnoj'], plural: ['hladnim']),
      neuter:
          new DeclensionByGender(singular: ['hladnom'], plural: ['hladnim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['hladnog'], plural: ['hladnih']),
      feminine:
          new DeclensionByGender(singular: ['hladne'], plural: ['hladnih']),
      neuter:
          new DeclensionByGender(singular: ['hladnog'], plural: ['hladnih']),
    ),
  );
  static final Adjective vruc = Adjective(
    dictionary: 'vruć',
    toAvoid: [Tags.Human, Tags.Animal],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['vrući'], plural: ['vrući']),
      feminine: new DeclensionByGender(singular: ['vruća'], plural: ['vruće']),
      neuter: new DeclensionByGender(singular: ['vruće'], plural: ['vruća']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['vrući'], plural: ['vruće']),
      feminine: new DeclensionByGender(singular: ['vruću'], plural: ['vruće']),
      neuter: new DeclensionByGender(singular: ['vruće'], plural: ['vruće']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['vrućim'], plural: ['vrućim']),
      feminine:
          new DeclensionByGender(singular: ['vrućom'], plural: ['vrućim']),
      neuter: new DeclensionByGender(singular: ['vrućim'], plural: ['vrućim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['vrućem'], plural: ['vrućim']),
      feminine:
          new DeclensionByGender(singular: ['vrućoj'], plural: ['vrućim']),
      neuter: new DeclensionByGender(singular: ['vrućem'], plural: ['vrućim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['vruća'], plural: ['vrućih']),
      feminine: new DeclensionByGender(singular: ['vruće'], plural: ['vrućih']),
      neuter: new DeclensionByGender(singular: ['vruća'], plural: ['vrućih']),
    ),
  );
  static final Adjective drug = Adjective(
    dictionary: 'drug',
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['drugi'], plural: ['drugi']),
      feminine: new DeclensionByGender(singular: ['druga'], plural: ['druge']),
      neuter: new DeclensionByGender(singular: ['drugo'], plural: ['druga']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['drugi'], plural: ['druge']),
      feminine: new DeclensionByGender(singular: ['drugu'], plural: ['druge']),
      neuter: new DeclensionByGender(singular: ['drugo'], plural: ['druga']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['drugim'], plural: ['drugim']),
      feminine:
          new DeclensionByGender(singular: ['drugom'], plural: ['drugim']),
      neuter: new DeclensionByGender(singular: ['drugim'], plural: ['drugim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['drugom'], plural: ['drugim']),
      feminine:
          new DeclensionByGender(singular: ['drugoj'], plural: ['drugim']),
      neuter: new DeclensionByGender(singular: ['drugom'], plural: ['drugim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['drugog'], plural: ['drugih']),
      feminine: new DeclensionByGender(singular: ['druge'], plural: ['drugih']),
      neuter: new DeclensionByGender(singular: ['drugog'], plural: ['drugih']),
    ),
  );
  static final Adjective skup = Adjective(
    dictionary: 'skup',
    toAvoid: [
      Tags.Human,
      Tags.Animal,
      Tags.Health,
      Tags.Location,
      Tags.Country,
      Tags.Emotion,
      Tags.Weather,
      Tags.Season,
    ],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['skupi'], plural: ['skupi']),
      feminine: new DeclensionByGender(singular: ['skupa'], plural: ['skupe']),
      neuter: new DeclensionByGender(singular: ['skupo'], plural: ['skupa']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['skupi'], plural: ['skupe']),
      feminine: new DeclensionByGender(singular: ['skupu'], plural: ['skupe']),
      neuter: new DeclensionByGender(singular: ['skupo'], plural: ['skupa']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['skupim'], plural: ['skupim']),
      feminine:
          new DeclensionByGender(singular: ['skupom'], plural: ['skupim']),
      neuter: new DeclensionByGender(singular: ['skupim'], plural: ['skupim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['skupom'], plural: ['skupim']),
      feminine:
          new DeclensionByGender(singular: ['skupoj'], plural: ['skupim']),
      neuter: new DeclensionByGender(singular: ['skupom'], plural: ['skupim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['skupog'], plural: ['skupih']),
      feminine: new DeclensionByGender(singular: ['skupe'], plural: ['skupih']),
      neuter: new DeclensionByGender(singular: ['skupog'], plural: ['skupih']),
    ),
  );
  static final Adjective tuzan = Adjective(
    dictionary: 'tužan',
    toAvoid: [Tags.Thing, Tags.Emotion],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tužni'], plural: ['tužni']),
      feminine: new DeclensionByGender(singular: ['tužna'], plural: ['tužne']),
      neuter: new DeclensionByGender(singular: ['tužno'], plural: ['tužna']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tužni'], plural: ['tužne']),
      feminine: new DeclensionByGender(singular: ['tužnu'], plural: ['tužne']),
      neuter: new DeclensionByGender(singular: ['tužno'], plural: ['tužna']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['tužnim'], plural: ['tužnim']),
      feminine:
          new DeclensionByGender(singular: ['tužnom'], plural: ['tužnim']),
      neuter: new DeclensionByGender(singular: ['tužnim'], plural: ['tužnim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['tužnom'], plural: ['tužnim']),
      feminine:
          new DeclensionByGender(singular: ['tužnoj'], plural: ['tužnim']),
      neuter: new DeclensionByGender(singular: ['tužnom'], plural: ['tužnim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['tužnog'], plural: ['tužnih']),
      feminine: new DeclensionByGender(singular: ['tužne'], plural: ['tužnih']),
      neuter: new DeclensionByGender(singular: ['tužnog'], plural: ['tužnih']),
    ),
  );

  static final Adjective sretan = Adjective(
    dictionary: 'sretan',
    toAvoid: [Tags.Thing, Tags.Emotion],
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['sretni'], plural: ['sretni']),
      feminine:
          new DeclensionByGender(singular: ['sretna'], plural: ['sretne']),
      neuter: new DeclensionByGender(singular: ['sretno'], plural: ['sretna']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['sretni'], plural: ['sretne']),
      feminine:
          new DeclensionByGender(singular: ['sretnu'], plural: ['sretne']),
      neuter: new DeclensionByGender(singular: ['sretno'], plural: ['sretna']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['sretnim'], plural: ['sretnim']),
      feminine:
          new DeclensionByGender(singular: ['sretnom'], plural: ['sretnim']),
      neuter:
          new DeclensionByGender(singular: ['sretnim'], plural: ['sretnim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['sretnom'], plural: ['sretnim']),
      feminine:
          new DeclensionByGender(singular: ['sretnoj'], plural: ['sretnim']),
      neuter:
          new DeclensionByGender(singular: ['sretnom'], plural: ['sretnim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['sretnog'], plural: ['sretnih']),
      feminine:
          new DeclensionByGender(singular: ['sretne'], plural: ['sretnih']),
      neuter:
          new DeclensionByGender(singular: ['sretnog'], plural: ['sretnih']),
    ),
  );

  static final Adjective sladak = Adjective(
    dictionary: 'sladak',
    toAvoid: [
      Tags.BodyPart,
      Tags.Country,
      Tags.Emotion,
      Tags.Furniture,
      Tags.FlatSurface,
      Tags.Activity,
      Tags.Adult
    ],
    nominativ: Declension(
        masculine:
            new DeclensionByGender(singular: ['slatki'], plural: ['slatki']),
        feminine:
            new DeclensionByGender(singular: ['slatka'], plural: ['slatke']),
        neuter:
            new DeclensionByGender(singular: ['slatko'], plural: ['slatka'])),
    akuzativ: Declension(
        masculine:
            new DeclensionByGender(singular: ['slatki'], plural: ['slatke']),
        feminine:
            new DeclensionByGender(singular: ['slatku'], plural: ['slatke']),
        neuter:
            new DeclensionByGender(singular: ['slatko'], plural: ['slatka'])),
    instrumental: Declension(
      masculine: new DeclensionByGender(
          singular: ['slatkim'], plural: ['slatkim', 'slatkima']),
      feminine: new DeclensionByGender(
          singular: ['slatkom'], plural: ['slatkim', 'slatkima']),
      neuter: new DeclensionByGender(
          singular: ['slatkim'], plural: ['slatkim', 'slatkima']),
    ),
    lokativ: Declension(
      masculine: new DeclensionByGender(
          singular: ['slatkom', 'slatkome', 'slatkomu'],
          plural: ['slatkim', 'slatkima']),
      feminine: new DeclensionByGender(
          singular: ['slatkoj'], plural: ['slatkim', 'slatkima']),
      neuter: new DeclensionByGender(
          singular: ['slatkom', 'slatkome', 'slatkomu'],
          plural: ['slatkim', 'slatkima']),
    ),
    genitiv: Declension(
      masculine: new DeclensionByGender(
          singular: ['slatkog', 'slatkoga'], plural: ['slatkih']),
      feminine:
          new DeclensionByGender(singular: ['slatke'], plural: ['slatkih']),
      neuter: new DeclensionByGender(
          singular: ['slatkog', 'slatkoga'], plural: ['slatkih']),
    ),
  );

  static final Adjective bolji = Adjective(
    dictionary: 'bolji',
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['bolji'], plural: ['bolji']),
      feminine: new DeclensionByGender(singular: ['bolja'], plural: ['bolje']),
      neuter: new DeclensionByGender(singular: ['boljo'], plural: ['bolja']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['bolji'], plural: ['bolje']),
      feminine: new DeclensionByGender(singular: ['bolju'], plural: ['bolje']),
      neuter: new DeclensionByGender(singular: ['boljo'], plural: ['bolja']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['boljim'], plural: ['boljim']),
      feminine:
          new DeclensionByGender(singular: ['boljom'], plural: ['boljim']),
      neuter: new DeclensionByGender(singular: ['boljim'], plural: ['boljim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['boljom'], plural: ['boljim']),
      feminine:
          new DeclensionByGender(singular: ['boljoj'], plural: ['boljim']),
      neuter: new DeclensionByGender(singular: ['boljom'], plural: ['boljim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['boljeg'], plural: ['boljih']),
      feminine: new DeclensionByGender(singular: ['bolje'], plural: ['boljih']),
      neuter: new DeclensionByGender(singular: ['boljeg'], plural: ['boljih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );

  static final Adjective najbolji = Adjective(
    dictionary: 'najbolji',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najbolji'], plural: ['najbolji']),
      feminine:
          new DeclensionByGender(singular: ['najbolja'], plural: ['najbolje']),
      neuter:
          new DeclensionByGender(singular: ['najboljo'], plural: ['najbolja']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['najbolji'], plural: ['najbolje']),
      feminine:
          new DeclensionByGender(singular: ['najbolju'], plural: ['najbolje']),
      neuter:
          new DeclensionByGender(singular: ['najboljo'], plural: ['najbolja']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['najboljim'], plural: ['najboljim']),
      feminine: new DeclensionByGender(
          singular: ['najboljom'], plural: ['najboljim']),
      neuter: new DeclensionByGender(
          singular: ['najboljim'], plural: ['najboljim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['najboljom'], plural: ['najboljim']),
      feminine: new DeclensionByGender(
          singular: ['najboljoj'], plural: ['najboljim']),
      neuter: new DeclensionByGender(
          singular: ['najboljom'], plural: ['najboljim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['najboljeg'], plural: ['najboljih']),
      feminine:
          new DeclensionByGender(singular: ['najbolje'], plural: ['najboljih']),
      neuter: new DeclensionByGender(
          singular: ['najboljeg'], plural: ['najboljih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
}
