import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';

class PossessivePronounBank {
  static final moj = Adjective(
    dictionary: 'moj',
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
      masculine: new DeclensionByGender(singular: ['mojim'], plural: ['mojim']),
      feminine: new DeclensionByGender(singular: ['mojom'], plural: ['mojim']),
      neuter: new DeclensionByGender(singular: ['mojim'], plural: ['mojim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['mojem', 'mom'], plural: ['mojim']),
      feminine: new DeclensionByGender(singular: ['mojoj'], plural: ['mojim']),
      neuter:
          new DeclensionByGender(singular: ['mojem', 'mom'], plural: ['mojim']),
    ),
    dativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['mojem', 'mom'], plural: ['mojim']),
      feminine: new DeclensionByGender(singular: ['mojoj'], plural: ['mojim']),
      neuter:
          new DeclensionByGender(singular: ['mojem', 'mom'], plural: ['mojim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['mojeg', 'mog'], plural: ['mojih']),
      feminine: new DeclensionByGender(singular: ['moje'], plural: ['mojih']),
      neuter:
          new DeclensionByGender(singular: ['mojeg', 'mog'], plural: ['mojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['moj'], plural: ['moji']),
      feminine: new DeclensionByGender(singular: ['moja'], plural: ['moje']),
      neuter: new DeclensionByGender(singular: ['moje'], plural: ['moja']),
    ),
  );

  static final tvoj = Adjective(
    dictionary: 'tvoj',
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
      masculine:
          new DeclensionByGender(singular: ['tvojim'], plural: ['tvojim']),
      feminine: new DeclensionByGender(singular: ['tvom'], plural: ['tvojim']),
      neuter: new DeclensionByGender(singular: ['tvojim'], plural: ['tvojim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tvojom', 'tvom'], plural: ['tvojim']),
      feminine:
          new DeclensionByGender(singular: ['tvojoj'], plural: ['tvojim']),
      neuter: new DeclensionByGender(
          singular: ['tvojom', 'tvom'], plural: ['tvojim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tvojem', 'tvom'], plural: ['tvojim']),
      feminine:
          new DeclensionByGender(singular: ['tvojoj'], plural: ['tvojim']),
      neuter: new DeclensionByGender(
          singular: ['tvojem', 'tvom'], plural: ['tvojim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['tvojeg', 'tvog'], plural: ['tvojih']),
      feminine: new DeclensionByGender(singular: ['tvoje'], plural: ['tvojih']),
      neuter: new DeclensionByGender(
          singular: ['tvojeg', 'tvog'], plural: ['tvojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tvoj'], plural: ['tvoji']),
      feminine: new DeclensionByGender(singular: ['tvoja'], plural: ['tvoje']),
      neuter: new DeclensionByGender(singular: ['tvoje'], plural: ['tvoja']),
    ),
  );
  static final svoj = Adjective(
    dictionary: 'svoj',
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
      masculine:
          new DeclensionByGender(singular: ['svojim'], plural: ['svojim']),
      feminine:
          new DeclensionByGender(singular: ['svojom'], plural: ['svojim']),
      neuter: new DeclensionByGender(singular: ['svojim'], plural: ['svojim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['svojem', 'svom'], plural: ['svojim']),
      feminine:
          new DeclensionByGender(singular: ['svojoj'], plural: ['svojim']),
      neuter: new DeclensionByGender(
          singular: ['svojem', 'svom'], plural: ['svojim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(
          singular: ['svojem', 'svom'], plural: ['svojim']),
      feminine:
          new DeclensionByGender(singular: ['svojoj'], plural: ['svojim']),
      neuter: new DeclensionByGender(
          singular: ['svojem', 'svom'], plural: ['svojim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(
          singular: ['svojeg', 'svog'], plural: ['svojih']),
      feminine: new DeclensionByGender(singular: ['svoje'], plural: ['svojih']),
      neuter: new DeclensionByGender(
          singular: ['svojeg', 'svog'], plural: ['svojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['svoj'], plural: ['svoji']),
      feminine: new DeclensionByGender(singular: ['svoja'], plural: ['svoje']),
      neuter: new DeclensionByGender(singular: ['svoje'], plural: ['svoja']),
    ),
  );
  static final njegov = Adjective(
    dictionary: 'njegov',
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
      masculine:
          new DeclensionByGender(singular: ['njegovim'], plural: ['njegovim']),
      feminine:
          new DeclensionByGender(singular: ['njegovim'], plural: ['njegovim']),
      neuter:
          new DeclensionByGender(singular: ['njegovim'], plural: ['njegovim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegovim'], plural: ['njegovim']),
      feminine:
          new DeclensionByGender(singular: ['njegovoj'], plural: ['njegovim']),
      neuter:
          new DeclensionByGender(singular: ['njegovu'], plural: ['njegovim']),
    ),
    dativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegovim'], plural: ['njegovim']),
      feminine:
          new DeclensionByGender(singular: ['njegovoj'], plural: ['njegovim']),
      neuter:
          new DeclensionByGender(singular: ['njegovu'], plural: ['njegovim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegovog'], plural: ['njegovih']),
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
      masculine:
          new DeclensionByGender(singular: ['njezinim'], plural: ['njezinim']),
      feminine:
          new DeclensionByGender(singular: ['njenom'], plural: ['njezinim']),
      neuter:
          new DeclensionByGender(singular: ['njezinim'], plural: ['njezinim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezinom'], plural: ['njezinim']),
      feminine:
          new DeclensionByGender(singular: ['njezinoj'], plural: ['njezinim']),
      neuter:
          new DeclensionByGender(singular: ['njezinu'], plural: ['njezinim']),
    ),
    dativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezinom'], plural: ['njezinim']),
      feminine:
          new DeclensionByGender(singular: ['njezinoj'], plural: ['njezinim']),
      neuter:
          new DeclensionByGender(singular: ['njezinu'], plural: ['njezinim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezinog'], plural: ['njezinim']),
      feminine:
          new DeclensionByGender(singular: ['njezine'], plural: ['njezinim']),
      neuter:
          new DeclensionByGender(singular: ['njezina'], plural: ['njezinim']),
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
      masculine:
          new DeclensionByGender(singular: ['njihovim'], plural: ['njihovim']),
      feminine:
          new DeclensionByGender(singular: ['njihovom'], plural: ['njihovim']),
      neuter:
          new DeclensionByGender(singular: ['njihovim'], plural: ['njihovim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njihovom'], plural: ['njihovim']),
      feminine:
          new DeclensionByGender(singular: ['njihovoj'], plural: ['njihovim']),
      neuter:
          new DeclensionByGender(singular: ['njihovu'], plural: ['njihovim']),
    ),
    dativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njihovom'], plural: ['njihovim']),
      feminine:
          new DeclensionByGender(singular: ['njihovoj'], plural: ['njihovim']),
      neuter:
          new DeclensionByGender(singular: ['njihovu'], plural: ['njihovim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njihovog'], plural: ['njihovih']),
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
      masculine: new DeclensionByGender(singular: ['našim'], plural: ['našim']),
      feminine: new DeclensionByGender(singular: ['našom'], plural: ['našim']),
      neuter: new DeclensionByGender(singular: ['našim'], plural: ['našim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['našem'], plural: ['našim']),
      feminine: new DeclensionByGender(singular: ['našoj'], plural: ['našim']),
      neuter: new DeclensionByGender(singular: ['našem'], plural: ['našim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: ['našem'], plural: ['našim']),
      feminine: new DeclensionByGender(singular: ['našoj'], plural: ['našim']),
      neuter: new DeclensionByGender(singular: ['našem'], plural: ['našim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: ['našeg'], plural: ['naših']),
      feminine: new DeclensionByGender(singular: ['naše'], plural: ['naših']),
      neuter: new DeclensionByGender(singular: ['našeg'], plural: ['naših']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['naš'], plural: ['naši']),
      feminine: new DeclensionByGender(singular: ['naša'], plural: ['naše']),
      neuter: new DeclensionByGender(singular: ['naše'], plural: ['naša']),
    ),
  );
  static final vas = Adjective(
    dictionary: 'vaš',
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
      masculine: new DeclensionByGender(singular: ['vašim'], plural: ['vašim']),
      feminine: new DeclensionByGender(singular: ['vašom'], plural: ['vašim']),
      neuter: new DeclensionByGender(singular: ['vašim'], plural: ['vašim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['vašem'], plural: ['vašim']),
      feminine: new DeclensionByGender(singular: ['vašoj'], plural: ['vašim']),
      neuter: new DeclensionByGender(singular: ['vašem'], plural: ['vašim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: ['vašem'], plural: ['vašim']),
      feminine: new DeclensionByGender(singular: ['vašoj'], plural: ['vašim']),
      neuter: new DeclensionByGender(singular: ['vašem'], plural: ['vašim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: ['vašeg'], plural: ['vaših']),
      feminine: new DeclensionByGender(singular: ['vaše'], plural: ['vaših']),
      neuter: new DeclensionByGender(singular: ['vašeg'], plural: ['vaših']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['vaš'], plural: ['vaši']),
      feminine: new DeclensionByGender(singular: ['vaša'], plural: ['vaše']),
      neuter: new DeclensionByGender(singular: ['vaše'], plural: ['vaša']),
    ),
  );
  static final ovaj = Adjective(
    dictionary: 'ovaj',
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
      masculine: new DeclensionByGender(singular: ['ovim'], plural: ['ovim']),
      feminine: new DeclensionByGender(singular: ['ovom'], plural: ['ovim']),
      neuter: new DeclensionByGender(singular: ['ovim'], plural: ['ovim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['ovom'], plural: ['ovim']),
      feminine: new DeclensionByGender(singular: ['ovoj'], plural: ['ovim']),
      neuter: new DeclensionByGender(singular: ['ovom'], plural: ['ovim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: ['ovom'], plural: ['ovim']),
      feminine: new DeclensionByGender(singular: ['ovoj'], plural: ['ovim']),
      neuter: new DeclensionByGender(singular: ['ovom'], plural: ['ovim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: ['ovog'], plural: ['ovih']),
      feminine: new DeclensionByGender(singular: ['ove'], plural: ['ovih']),
      neuter: new DeclensionByGender(singular: ['ovog'], plural: ['ovih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  );
}
