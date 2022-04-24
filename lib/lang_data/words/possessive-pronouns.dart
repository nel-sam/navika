import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class PossessivePronounBank {
  static final moj = Adjective(
    dictionary: 'moj',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['moj'], plural: ['moji']),
      feminine: new DeclensionByGender(singular: ['moja'], plural: ['moje']),
      neuter: new DeclensionByGender(singular: ['moje'], plural: ['moja']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['moj'], plural: ['moje']),
      feminine: new DeclensionByGender(singular: ['moju'], plural: ['moje']),
      neuter: new DeclensionByGender(singular: ['moje'], plural: ['moja']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['mojim'], plural: ['mojim', 'mojima']),
      feminine: new DeclensionByGender(
          singular: ['mojom'], plural: ['mojim', 'mojima']),
      neuter: new DeclensionByGender(
          singular: ['mojim'], plural: ['mojim', 'mojima']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['mojemu', 'mojem', 'mome', 'mom'],
          plural: ['mojim', 'mojima']),
      feminine: new DeclensionByGender(
          singular: ['mojoj'], plural: ['mojim', 'mojima']),
      neuter: new DeclensionByGender(
          singular: ['mojemu', 'mojem', 'mome', 'mom'],
          plural: ['mojim', 'mojima']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['mojem', 'mojemu', 'mome', 'mom'],
          plural: ['mojim', 'mojima']),
      feminine: new DeclensionByGender(
          singular: ['mojoj'], plural: ['mojim', 'mojima']),
      neuter: new DeclensionByGender(
          singular: ['mojem', 'mojemu', 'mome', 'mom'],
          plural: ['mojim', 'mojima']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['mojeg', 'mojega', 'mog', 'moga'], plural: ['mojih']),
      feminine: new DeclensionByGender(singular: ['moje'], plural: ['mojih']),
      neuter: new DeclensionByGender(
          singular: ['mojeg', 'mojega', 'mog', 'moga'], plural: ['mojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['moj'], plural: ['moji']),
      feminine: new DeclensionByGender(singular: ['moja'], plural: ['moje']),
      neuter: new DeclensionByGender(singular: ['moje'], plural: ['moja']),
    ),
  );
  static final tvoj = Adjective(
    dictionary: 'tvoj',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tvoj'], plural: ['tvoji']),
      feminine: new DeclensionByGender(singular: ['tvoja'], plural: ['tvoje']),
      neuter: new DeclensionByGender(singular: ['tvoje'], plural: ['tvoja']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tvoj'], plural: ['tvoje']),
      feminine: new DeclensionByGender(singular: ['tvoju'], plural: ['tvoje']),
      neuter: new DeclensionByGender(singular: ['tvoje'], plural: ['tvoja']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tvojim'], plural: ['tvojim', 'tvojima']),
      feminine: new DeclensionByGender(
          singular: ['tvom'], plural: ['tvojim', 'tvojima']),
      neuter: new DeclensionByGender(
          singular: ['tvojim'], plural: ['tvojim', 'tvojima']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tvojom', 'tvom'], plural: ['tvojim', 'tvojima']),
      feminine: new DeclensionByGender(
          singular: ['tvojoj'], plural: ['tvojim', 'tvojima']),
      neuter: new DeclensionByGender(
          singular: ['tvojom', 'tvom'], plural: ['tvojim', 'tvojima']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tvojemu', 'tvojem', 'tvome', 'tvom'],
          plural: ['tvojim', 'tvojima']),
      feminine: new DeclensionByGender(
          singular: ['tvojoj'], plural: ['tvojim', 'tvojima']),
      neuter: new DeclensionByGender(
          singular: ['tvojemu', 'tvojem', 'tvome', 'tvom'],
          plural: ['tvojim', 'tvojima']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tvojega', 'tvojeg', 'tvoga', 'tvog'], plural: ['tvojih']),
      feminine: new DeclensionByGender(singular: ['tvoje'], plural: ['tvojih']),
      neuter: new DeclensionByGender(
          singular: ['tvojega', 'tvojeg', 'tvoga', 'tvog'], plural: ['tvojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tvoj'], plural: ['tvoji']),
      feminine: new DeclensionByGender(singular: ['tvoja'], plural: ['tvoje']),
      neuter: new DeclensionByGender(singular: ['tvoje'], plural: ['tvoja']),
    ),
  );
  static final svoj = Adjective(
    dictionary: 'svoj',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['svoj'], plural: ['svoji']),
      feminine: new DeclensionByGender(singular: ['svoja'], plural: ['svoje']),
      neuter: new DeclensionByGender(singular: ['svoje'], plural: ['svoja']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['svoj'], plural: ['svoje']),
      feminine: new DeclensionByGender(singular: ['svoju'], plural: ['svoje']),
      neuter: new DeclensionByGender(singular: ['svoje'], plural: ['svoja']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['svojim'], plural: ['svojim', 'svojima']),
      feminine: new DeclensionByGender(
          singular: ['svojom'], plural: ['svojim', 'svojima']),
      neuter: new DeclensionByGender(
          singular: ['svojim'], plural: ['svojim', 'svojima']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['svojemu', 'svojem', 'svome', 'svom'],
          plural: ['svojim', 'svojima']),
      feminine: new DeclensionByGender(
          singular: ['svojoj'], plural: ['svojim', 'svojima']),
      neuter: new DeclensionByGender(
          singular: ['svojemu', 'svojem', 'svome', 'svom'],
          plural: ['svojim', 'svojima']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['svojemu', 'svojem', 'svome', 'svom'],
          plural: ['svojim', 'svojima']),
      feminine: new DeclensionByGender(
          singular: ['svojoj'], plural: ['svojim', 'svojima']),
      neuter: new DeclensionByGender(
          singular: ['svojemu', 'svojem', 'svome', 'svom'],
          plural: ['svojim', 'svojima']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['svojega', 'svojeg', 'svog', 'svoga'], plural: ['svojih']),
      feminine: new DeclensionByGender(singular: ['svoje'], plural: ['svojih']),
      neuter: new DeclensionByGender(
          singular: ['svojega', 'svojeg', 'svog', 'svoga'], plural: ['svojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['svoj'], plural: ['svoji']),
      feminine: new DeclensionByGender(singular: ['svoja'], plural: ['svoje']),
      neuter: new DeclensionByGender(singular: ['svoje'], plural: ['svoja']),
    ),
  );
  static final njegov = Adjective(
    dictionary: 'njegov',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegov'], plural: ['njegovi']),
      feminine:
          new DeclensionByGender(singular: ['njegova'], plural: ['njegove']),
      neuter:
          new DeclensionByGender(singular: ['njegovo'], plural: ['njegova']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegov'], plural: ['njegove']),
      feminine:
          new DeclensionByGender(singular: ['njegovu'], plural: ['njegove']),
      neuter:
          new DeclensionByGender(singular: ['njegovo'], plural: ['njegova']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njegovim'], plural: ['njegovima', 'njegovim']),
      feminine: new DeclensionByGender(
          singular: ['njegovom'], plural: ['njegovima', 'njegovim']),
      neuter: new DeclensionByGender(
          singular: ['njegovim'], plural: ['njegovima', 'njegovim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njegovu', 'njegovome', 'njegovomu', 'njegovom'],
          plural: ['njegovima', 'njegovim']),
      feminine: new DeclensionByGender(
          singular: ['njegovoj'], plural: ['njegovima', 'njegovim']),
      neuter: new DeclensionByGender(
          singular: ['njegovu'], plural: ['njegovima', 'njegovim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njegovu', 'njegovome', 'njegovomu', 'njegovom'],
          plural: ['njegovima', 'njegovim']),
      feminine: new DeclensionByGender(
          singular: ['njegovoj'], plural: ['njegovima', 'njegovim']),
      neuter: new DeclensionByGender(
          singular: ['njegovu'], plural: ['njegovima', 'njegovim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njegovoga', 'njegovog', 'njegova'], plural: ['njegovih']),
      feminine:
          new DeclensionByGender(singular: ['njegove'], plural: ['njegovih']),
      neuter:
          new DeclensionByGender(singular: ['njegova'], plural: ['njegovih']),
    ),
    vokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegov'], plural: ['njegovi']),
      feminine:
          new DeclensionByGender(singular: ['njegova'], plural: ['njegove']),
      neuter:
          new DeclensionByGender(singular: ['njegovo'], plural: ['njegova']),
    ),
  );
  static final njezin = Adjective(
    dictionary: 'njezin',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezin'], plural: ['njezini']),
      feminine:
          new DeclensionByGender(singular: ['njezina'], plural: ['njezine']),
      neuter:
          new DeclensionByGender(singular: ['njezino'], plural: ['njezina']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezin'], plural: ['njezine']),
      feminine:
          new DeclensionByGender(singular: ['njezinu'], plural: ['njezine']),
      neuter:
          new DeclensionByGender(singular: ['njezino'], plural: ['njezina']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njezinim'], plural: ['njezinima', 'njezinim']),
      feminine: new DeclensionByGender(
          singular: ['njenom'], plural: ['njezinima', 'njezinim']),
      neuter: new DeclensionByGender(
          singular: ['njezinim'], plural: ['njezinima', 'njezinim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njezinome', 'njezinomu', 'njezinom', 'njezinu'],
          plural: ['njezinima', 'njezinim']),
      feminine: new DeclensionByGender(
          singular: ['njezinoj'], plural: ['njezinima', 'njezinim']),
      neuter: new DeclensionByGender(
          singular: ['njezinu'], plural: ['njezinima', 'njezinim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njezinome', 'njezinomu', 'njezinom', 'njezinu'],
          plural: ['njezinima', 'njezinim']),
      feminine: new DeclensionByGender(
          singular: ['njezinoj'], plural: ['njezinima', 'njezinim']),
      neuter: new DeclensionByGender(
          singular: ['njezinu'], plural: ['njezinima', 'njezinim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njezinoga', 'njezinog', 'njezina'],
          plural: ['njezinima', 'njezinim']),
      feminine: new DeclensionByGender(
          singular: ['njezine'], plural: ['njezinima', 'njezinim']),
      neuter: new DeclensionByGender(
          singular: ['njezina'], plural: ['njezinima', 'njezinim']),
    ),
    vokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezin'], plural: ['njezini']),
      feminine:
          new DeclensionByGender(singular: ['njezina'], plural: ['njezine']),
      neuter:
          new DeclensionByGender(singular: ['njezino'], plural: ['njezina']),
    ),
  );
  static final njihov = Adjective(
    dictionary: 'njihov',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njihov'], plural: ['njihovi']),
      feminine:
          new DeclensionByGender(singular: ['njihova'], plural: ['njihove']),
      neuter:
          new DeclensionByGender(singular: ['njihovo'], plural: ['njihova']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njihov'], plural: ['njihove']),
      feminine:
          new DeclensionByGender(singular: ['njihovu'], plural: ['njihove']),
      neuter:
          new DeclensionByGender(singular: ['njihovo'], plural: ['njihova']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njihovim'], plural: ['njihovima', 'njihovim']),
      feminine: new DeclensionByGender(
          singular: ['njihovom'], plural: ['njihovima', 'njihovim']),
      neuter: new DeclensionByGender(
          singular: ['njihovim'], plural: ['njihovima', 'njihovim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njihovu', 'njihovome', 'njihovomu', 'njihovom'],
          plural: ['njihovima', 'njihovim']),
      feminine: new DeclensionByGender(
          singular: ['njihovoj'], plural: ['njihovima', 'njihovim']),
      neuter: new DeclensionByGender(
          singular: ['njihovu'], plural: ['njihovima', 'njihovim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njihovome', 'njihovomu', 'njihovom', 'njihovu'],
          plural: ['njihovima', 'njihovim']),
      feminine: new DeclensionByGender(
          singular: ['njihovoj'], plural: ['njihovima', 'njihovim']),
      neuter: new DeclensionByGender(
          singular: ['njihovu'], plural: ['njihovima', 'njihovim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['njihova', 'njihovog', 'njihovoga'], plural: ['njihovih']),
      feminine:
          new DeclensionByGender(singular: ['njihove'], plural: ['njihovih']),
      neuter:
          new DeclensionByGender(singular: ['njihova'], plural: ['njihovih']),
    ),
    vokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njihov'], plural: ['njihovi']),
      feminine:
          new DeclensionByGender(singular: ['njihova'], plural: ['njihove']),
      neuter:
          new DeclensionByGender(singular: ['njihovo'], plural: ['njihova']),
    ),
  );
  static final nas = Adjective(
    dictionary: 'naš',
    toAvoid: [Tags.Season, Tags.Country, Tags.Weather],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['naš'], plural: ['naši']),
      feminine: new DeclensionByGender(singular: ['naša'], plural: ['naše']),
      neuter: new DeclensionByGender(singular: ['naše'], plural: ['naša']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['naš'], plural: ['naše']),
      feminine: new DeclensionByGender(singular: ['našu'], plural: ['naše']),
      neuter: new DeclensionByGender(singular: ['naše'], plural: ['naša']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['našim'], plural: ['našima', 'našim']),
      feminine: new DeclensionByGender(
          singular: ['našom'], plural: ['našima', 'našim']),
      neuter: new DeclensionByGender(
          singular: ['našim'], plural: ['našima', 'našim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['našemu', 'našem'], plural: ['našima', 'našim']),
      feminine: new DeclensionByGender(
          singular: ['našoj'], plural: ['našima', 'našim']),
      neuter: new DeclensionByGender(
          singular: ['našemu', 'našem'], plural: ['našima', 'našim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['našemu', 'našem'], plural: ['našima', 'našim']),
      feminine: new DeclensionByGender(
          singular: ['našoj'], plural: ['našima', 'našim']),
      neuter: new DeclensionByGender(
          singular: ['našemu', 'našem'], plural: ['našima', 'našim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['našega', 'našeg'], plural: ['naših']),
      feminine: new DeclensionByGender(singular: ['naše'], plural: ['naših']),
      neuter: new DeclensionByGender(
          singular: ['našega', 'našeg'], plural: ['naših']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['naš'], plural: ['naši']),
      feminine: new DeclensionByGender(singular: ['naša'], plural: ['naše']),
      neuter: new DeclensionByGender(singular: ['naše'], plural: ['naša']),
    ),
  );
  static final vas = Adjective(
    dictionary: 'vaš',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['vaš'], plural: ['vaši']),
      feminine: new DeclensionByGender(singular: ['vaša'], plural: ['vaše']),
      neuter: new DeclensionByGender(singular: ['vaše'], plural: ['vaša']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['vaš'], plural: ['vaše']),
      feminine: new DeclensionByGender(singular: ['vašu'], plural: ['vaše']),
      neuter: new DeclensionByGender(singular: ['vaše'], plural: ['vaša']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(
          singular: ['vašim'], plural: ['vašima', 'vašim']),
      feminine: new DeclensionByGender(
          singular: ['vašom'], plural: ['vašima', 'vašim']),
      neuter: new DeclensionByGender(
          singular: ['vašim'], plural: ['vašima', 'vašim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['vašemu', 'vašem'], plural: ['vašima', 'vašim']),
      feminine: new DeclensionByGender(
          singular: ['vašoj'], plural: ['vašima', 'vašim']),
      neuter: new DeclensionByGender(
          singular: ['vašemu', 'vašem'], plural: ['vašima', 'vašim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['vašemu', 'vašem'], plural: ['vašima', 'vašim']),
      feminine: new DeclensionByGender(
          singular: ['vašoj'], plural: ['vašima', 'vašim']),
      neuter: new DeclensionByGender(
          singular: ['vašemu', 'vašem'], plural: ['vašima', 'vašim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['vašega', 'vašeg'], plural: ['vaših']),
      feminine: new DeclensionByGender(singular: ['vaše'], plural: ['vaših']),
      neuter: new DeclensionByGender(
          singular: ['vašega', 'vašeg'], plural: ['vaših']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['vaš'], plural: ['vaši']),
      feminine: new DeclensionByGender(singular: ['vaša'], plural: ['vaše']),
      neuter: new DeclensionByGender(singular: ['vaše'], plural: ['vaša']),
    ),
  );
  static final ovaj = Adjective(
    dictionary: 'ovaj',
    toAvoid: [Tags.Season, Tags.Country],
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['ovaj'], plural: ['ovi']),
      feminine: new DeclensionByGender(singular: ['ova'], plural: ['ove']),
      neuter: new DeclensionByGender(singular: ['ovo'], plural: ['ova']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['ovaj'], plural: ['ove']),
      feminine: new DeclensionByGender(singular: ['ovu'], plural: ['ove']),
      neuter: new DeclensionByGender(singular: ['ovo'], plural: ['ova']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['ovime', 'ovim'], plural: ['ovim']),
      feminine: new DeclensionByGender(singular: ['ovom'], plural: ['ovim']),
      neuter:
          new DeclensionByGender(singular: ['ovime', 'ovim'], plural: ['ovim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['ovome', 'ovomu', 'ovom'], plural: ['ovim']),
      feminine: new DeclensionByGender(singular: ['ovoj'], plural: ['ovim']),
      neuter: new DeclensionByGender(
          singular: ['ovome', 'ovomu', 'ovom'], plural: ['ovim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['ovome', 'ovomu', 'ovom'], plural: ['ovim']),
      feminine: new DeclensionByGender(singular: ['ovoj'], plural: ['ovim']),
      neuter: new DeclensionByGender(
          singular: ['ovome', 'ovomu', 'ovom'], plural: ['ovim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['ovoga', 'ovog'], plural: ['ovih']),
      feminine: new DeclensionByGender(singular: ['ove'], plural: ['ovih']),
      neuter:
          new DeclensionByGender(singular: ['ovoga', 'ovog'], plural: ['ovih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
}
