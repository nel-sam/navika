import 'package:navika/models/adjective.dart';
import 'package:navika/models/models.dart';

final List<Adjective> possessivePronounWordBank = [
  Adjective(
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
    akuzativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: ['mog'], plural: ['moje']),
      feminine: new DeclensionByGender(singular: ['moju'], plural: ['moje']),
      neuter: new DeclensionByGender(singular: ['moje'], plural: ['moja']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: ['mojim'], plural: ['mojim']),
      feminine: new DeclensionByGender(singular: ['mojom'], plural: ['mojim']),
      neuter: new DeclensionByGender(singular: ['mojim'], plural: ['mojim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['mom'], plural: ['mojim']),
      feminine: new DeclensionByGender(singular: ['mojoj'], plural: ['mojim']),
      neuter: new DeclensionByGender(singular: ['mom'], plural: ['mojim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: ['mom'], plural: ['mojim']),
      feminine: new DeclensionByGender(singular: ['mojoj'], plural: ['mojim']),
      neuter: new DeclensionByGender(singular: ['mom'], plural: ['mojim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: ['mog'], plural: ['mojih']),
      feminine: new DeclensionByGender(singular: ['moje'], plural: ['mojih']),
      neuter: new DeclensionByGender(singular: ['moga'], plural: ['mojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  ),
  Adjective(
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
    akuzativAnimate: new Declension(
      // TODO: Support multiple correct answers (tvog/tvojog)
      masculine: new DeclensionByGender(singular: ['tvog'], plural: ['tvoje']),
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
      // Add support for accepting tvojom/tvom, svojom/svom, etc
      masculine: new DeclensionByGender(singular: ['tvom'], plural: ['tvojim']),
      feminine:
          new DeclensionByGender(singular: ['tvojoj'], plural: ['tvojim']),
      neuter: new DeclensionByGender(singular: ['tvom'], plural: ['tvojim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tvom'], plural: ['tvojim']),
      feminine:
          new DeclensionByGender(singular: ['tvojoj'], plural: ['tvojim']),
      neuter: new DeclensionByGender(singular: ['tvom'], plural: ['tvojim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: ['tvog'], plural: ['tvojih']),
      feminine: new DeclensionByGender(singular: ['tvoje'], plural: ['tvojih']),
      neuter: new DeclensionByGender(singular: ['tvoga'], plural: ['tvojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  ),
  Adjective(
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
    akuzativAnimate: new Declension(
      masculine:
          new DeclensionByGender(singular: ['svojog'], plural: ['svoje']),
      feminine: new DeclensionByGender(singular: ['svoju'], plural: ['svoje']),
      neuter: new DeclensionByGender(singular: ['svoje'], plural: ['svoja']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['svojim'], plural: ['svojim']),
      feminine: new DeclensionByGender(singular: ['svom'], plural: ['svojim']),
      neuter: new DeclensionByGender(singular: ['svojim'], plural: ['svojim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['svom'], plural: ['svojim']),
      feminine:
          new DeclensionByGender(singular: ['svojoj'], plural: ['svojim']),
      neuter: new DeclensionByGender(singular: ['svom'], plural: ['svojim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: ['svom'], plural: ['svojim']),
      feminine:
          new DeclensionByGender(singular: ['svojoj'], plural: ['svojim']),
      neuter: new DeclensionByGender(singular: ['svom'], plural: ['svojim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['svojog'], plural: ['svojih']),
      feminine: new DeclensionByGender(singular: ['svoje'], plural: ['svojih']),
      neuter: new DeclensionByGender(singular: ['svojoga'], plural: ['svojih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  ),
  Adjective(
    dictionary: 'ovo',
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
    akuzativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: ['ovog'], plural: ['ove']),
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
  ),
  Adjective(
    dictionary: 'to',
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: ['taj'], plural: ['ta']),
      feminine: new DeclensionByGender(singular: ['ta'], plural: ['te']),
      neuter: new DeclensionByGender(singular: ['taj'], plural: ['ti']),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: ['taj'], plural: ['ta']),
      feminine: new DeclensionByGender(singular: ['tu'], plural: ['te']),
      neuter: new DeclensionByGender(singular: ['taj'], plural: ['ti']),
    ),
    akuzativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: ['tog'], plural: ['ta']),
      feminine: new DeclensionByGender(singular: ['tu'], plural: ['te']),
      neuter: new DeclensionByGender(singular: ['taj'], plural: ['ti']),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: ['tim'], plural: ['tim']),
      feminine: new DeclensionByGender(singular: ['tom'], plural: ['tim']),
      neuter: new DeclensionByGender(singular: ['tim'], plural: ['tim']),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tom'], plural: ['tim']),
      feminine: new DeclensionByGender(singular: ['toj'], plural: ['tim']),
      neuter: new DeclensionByGender(singular: ['tom'], plural: ['tim']),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: ['tom'], plural: ['tim']),
      feminine: new DeclensionByGender(singular: ['toj'], plural: ['tim']),
      neuter: new DeclensionByGender(singular: ['tom'], plural: ['tim']),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: ['tog'], plural: ['tih']),
      feminine: new DeclensionByGender(singular: ['te'], plural: ['tih']),
      neuter: new DeclensionByGender(singular: ['tog'], plural: ['tih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  ),
  Adjective(
    dictionary: 'njegov',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegov'], plural: ['njegovi']),
      feminine:
          new DeclensionByGender(singular: ['njegova'], plural: ['njegove']),
      neuter: new DeclensionByGender(singular: ['njegov'], plural: ['njegovi']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegov'], plural: ['njegove']),
      feminine:
          new DeclensionByGender(singular: ['njegovu'], plural: ['njegove']),
      neuter:
          new DeclensionByGender(singular: ['njegovo'], plural: ['njegova']),
    ),
    akuzativAnimate: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegovog'], plural: ['njegove']),
      feminine:
          new DeclensionByGender(singular: ['njegovu'], plural: ['njegove']),
      neuter:
          new DeclensionByGender(singular: ['njegovo'], plural: ['njegova']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegovim'], plural: ['njegovim']),
      feminine:
          new DeclensionByGender(singular: ['njegovom'], plural: ['njegovim']),
      neuter:
          new DeclensionByGender(singular: ['njegovim'], plural: ['njegovim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegovom'], plural: ['njegovim']),
      feminine:
          new DeclensionByGender(singular: ['njegovoj'], plural: ['njegovim']),
      neuter:
          new DeclensionByGender(singular: ['njegovom'], plural: ['njegovim']),
    ),
    dativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegovom'], plural: ['njegovim']),
      feminine:
          new DeclensionByGender(singular: ['njegovoj'], plural: ['njegovim']),
      neuter:
          new DeclensionByGender(singular: ['njegovom'], plural: ['njegovim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njegovog'], plural: ['njegovih']),
      feminine:
          new DeclensionByGender(singular: ['njegove'], plural: ['njegovih']),
      neuter:
          new DeclensionByGender(singular: ['njegovog'], plural: ['njegovih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  ),
  Adjective(
    dictionary: 'nju',
    nominativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezin'], plural: ['njezini']),
      feminine:
          new DeclensionByGender(singular: ['njezina'], plural: ['njezine']),
      neuter: new DeclensionByGender(singular: ['njezin'], plural: ['njezini']),
    ),
    akuzativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezin'], plural: ['njezine']),
      feminine:
          new DeclensionByGender(singular: ['njezinu'], plural: ['njezine']),
      neuter:
          new DeclensionByGender(singular: ['njezino'], plural: ['njezina']),
    ),
    akuzativAnimate: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezina'], plural: ['njezine']),
      feminine:
          new DeclensionByGender(singular: ['njezinu'], plural: ['njezine']),
      neuter:
          new DeclensionByGender(singular: ['njezino'], plural: ['njezina']),
    ),
    instrumental: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezinim'], plural: ['njezinim']),
      feminine: new DeclensionByGender(
          singular: ['njenom'], plural: ['njezinim']), // njenom short form?
      neuter:
          new DeclensionByGender(singular: ['njezinim'], plural: ['njezinim']),
    ),
    lokativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezinim'], plural: ['njezinim']),
      feminine: new DeclensionByGender(
          singular: ['njezinu'], plural: ['njezinim']), // njezinoj short form?
      neuter:
          new DeclensionByGender(singular: ['njezinim'], plural: ['njezinim']),
    ),
    dativ: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezinim'], plural: ['njezinim']),
      feminine: new DeclensionByGender(
          singular: ['njezinu'], plural: ['njezinim']), // njezinoj short form?
      neuter:
          new DeclensionByGender(singular: ['njezinim'], plural: ['njezinim']),
    ),
    genitiv: new Declension(
      masculine:
          new DeclensionByGender(singular: ['njezinog'], plural: ['njezinih']),
      feminine:
          new DeclensionByGender(singular: ['njezine'], plural: ['njezinih']),
      neuter:
          new DeclensionByGender(singular: ['njezinog'], plural: ['njezinih']),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: [''], plural: ['']),
      feminine: new DeclensionByGender(singular: [''], plural: ['']),
      neuter: new DeclensionByGender(singular: [''], plural: ['']),
    ),
  ),
];
