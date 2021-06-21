import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

/*
  Noun(dictionary: '',tags: [],gender: GenderEnum.Masculine,isAnimate: ,

  ),
*/

final List<Noun> nounWordBank = [
  Noun(
    dictionary: 'ananas',
    tags: [Tags.Food, Tags.Portable],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'ananas',
      plural: 'ananasi',
    ),
    genitiv: new DeclensionByCount(
      singular: 'ananasa',
      plural: 'ananasa',
    ),
    dativ: new DeclensionByCount(
      singular: 'ananasu',
      plural: 'ananasima',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'ananas',
      plural: 'ananase',
    ),
    lokativ: new DeclensionByCount(
      singular: 'ananasu',
      plural: 'ananasima',
    ),
    vokativ: new DeclensionByCount(
      singular: 'ananase',
      plural: 'ananasi',
    ),
    instrumental: new DeclensionByCount(
      singular: 'ananasom',
      plural: 'ananasima',
    ),
  ),
  Noun(
    dictionary: 'Bosna',
    tags: [Tags.Location, Tags.Country],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'Bosna',
      plural: '',
    ),
    genitiv: new DeclensionByCount(
      singular: 'Bosne',
      plural: '',
    ),
    dativ: new DeclensionByCount(
      singular: 'Bosni',
      plural: '',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'Bosnu',
      plural: '',
    ),
    lokativ: new DeclensionByCount(
      singular: 'Bosni',
      plural: '',
    ),
    vokativ: new DeclensionByCount(
      singular: 'Bosno',
      plural: '',
    ),
    instrumental: new DeclensionByCount(
      singular: 'Bosnom',
      plural: '',
    ),
  ),
  Noun(
    dictionary: 'slik',
    tags: [Tags.Thing, Tags.Portable],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'slik',
      plural: 'slikovi',
    ),
    genitiv: new DeclensionByCount(
      singular: 'slika',
      plural: 'slikova',
    ),
    dativ: new DeclensionByCount(
      singular: 'sliku',
      plural: 'slikovima',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'slik',
      plural: 'slikove',
    ),
    lokativ: new DeclensionByCount(
      singular: 'sliku',
      plural: 'slikovima',
    ),
    vokativ: new DeclensionByCount(
      singular: 'sliče',
      plural: 'slikovi',
    ),
    instrumental: new DeclensionByCount(
      singular: 'slikom',
      plural: 'slikovima',
    ),
  ),
  Noun(
    dictionary: 'lice',
    tags: [Tags.BodyPart],
    gender: Genders.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'lice',
      plural: 'lica',
    ),
    genitiv: new DeclensionByCount(
      singular: 'lica',
      plural: 'lica',
    ),
    dativ: new DeclensionByCount(
      singular: 'licu',
      plural: 'licima',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'lice',
      plural: 'lica',
    ),
    lokativ: new DeclensionByCount(
      singular: 'licu',
      plural: 'licima',
    ),
    vokativ: new DeclensionByCount(
      singular: 'lice',
      plural: 'lica',
    ),
    instrumental: new DeclensionByCount(
      singular: 'licem',
      plural: 'licima',
    ),
  ),
  Noun(
    dictionary: 'avion',
    tags: [Tags.Vehicle],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'avion',
      plural: 'avioni',
    ),
    genitiv: new DeclensionByCount(
      singular: 'aviona',
      plural: 'aviona',
    ),
    dativ: new DeclensionByCount(
      singular: 'avionu',
      plural: 'avionima',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'avion',
      plural: 'avione',
    ),
    lokativ: new DeclensionByCount(
      singular: 'avionu',
      plural: 'avionima',
    ),
    vokativ: new DeclensionByCount(
      singular: 'avione',
      plural: 'avioni',
    ),
    instrumental: new DeclensionByCount(
      singular: 'avionom',
      plural: 'avionima',
    ),
  ),
  Noun(
    dictionary: 'stol',
    tags: [
      Tags.FlatSurface,
      Tags.Furniture,
      Tags.Portable,
    ],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'stol',
      plural: 'stolovi',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'stol',
      plural: 'stolove',
    ),
    instrumental: new DeclensionByCount(
      singular: 'stolom',
      plural: 'stolovima',
    ),
    lokativ: new DeclensionByCount(
      singular: 'stolu',
      plural: 'stolovima',
    ),
    dativ: new DeclensionByCount(
      singular: 'stolu',
      plural: 'stolovima',
    ),
    genitiv: new DeclensionByCount(
      singular: 'stola',
      plural: 'stolova',
    ),
    vokativ: new DeclensionByCount(
      singular: 'stole',
      plural: 'stolovi',
    ),
  ),
  Noun(
    dictionary: 'žena',
    tags: [
      Tags.Human,
      Tags.Adult,
    ],
    gender: Genders.Feminine,
    isAnimate: true,
    nominativ: new DeclensionByCount(
      singular: 'žena',
      plural: 'žene',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'ženu',
      plural: 'žene',
    ),
    instrumental: new DeclensionByCount(
      singular: 'ženom',
      plural: 'ženama',
    ),
    lokativ: new DeclensionByCount(
      singular: 'ženi',
      plural: 'ženama',
    ),
    dativ: new DeclensionByCount(
      singular: 'ženi',
      plural: 'ženama',
    ),
    genitiv: new DeclensionByCount(
      singular: 'žene',
      plural: 'žena',
    ),
    vokativ: new DeclensionByCount(
      singular: 'ženo',
      plural: 'žene',
    ),
  ),
  Noun(
    dictionary: 'sestra',
    tags: [
      Tags.Human,
      Tags.Adult,
    ],
    gender: Genders.Feminine,
    isAnimate: true,
    nominativ: new DeclensionByCount(
      singular: 'sestra',
      plural: 'sestre',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'sestru',
      plural: 'sestre',
    ),
    instrumental: new DeclensionByCount(
      singular: 'sestrom',
      plural: 'sestrama',
    ),
    lokativ: new DeclensionByCount(
      singular: 'sestri',
      plural: 'sestrama',
    ),
    dativ: new DeclensionByCount(
      singular: 'sestri',
      plural: 'sestrama',
    ),
    genitiv: new DeclensionByCount(
      singular: 'sestre',
      plural: 'sestara',
    ),
    vokativ: new DeclensionByCount(
      singular: 'sestro',
      plural: 'sestre',
    ),
  ),
  Noun(
    dictionary: 'muškarac',
    tags: [
      Tags.Human,
      Tags.Adult,
    ],
    gender: Genders.Masculine,
    isAnimate: true,
    nominativ: new DeclensionByCount(
      singular: 'muškarac',
      plural: 'muškarci',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'muškarca',
      plural: 'muškarce',
    ),
    instrumental: new DeclensionByCount(
      singular: 'muškarcem',
      plural: 'muškarcima',
    ),
    lokativ: new DeclensionByCount(
      singular: 'muškarcu',
      plural: 'muškarcima',
    ),
    dativ: new DeclensionByCount(
      singular: 'muškarca',
      plural: 'muškarcima',
    ),
    genitiv: new DeclensionByCount(
      singular: 'muškarca',
      plural: 'muškaraca',
    ),
    vokativ: new DeclensionByCount(
      singular: 'muškarče',
      plural: 'muškarci',
    ),
  ),
  // TODO: Fix more declensions
  // Noun(
  //   dictionary: 'more',
  //   tags: [
  //     Tags.Location,
  //     Tags.NaturalFeature,
  //   ],
  //   gender: GenderEnum.Neuter,
  //   isAnimate: false,
  //   nominativ: new DeclensionByCount(
  //     singular: 'more',
  //     plural: 'mora',
  //   ),
  //   akuzativ: new DeclensionByCount(
  //     singular: 'more',
  //     plural: 'mora',
  //   ),
  //   instrumental: new DeclensionByCount(
  //     singular: 'morem',
  //     plural: 'morima',
  //   ),
  //   lokativ: new DeclensionByCount(
  //     singular: 'moru',
  //     plural: 'morima',
  //   ),
  //   dativ: new DeclensionByCount(
  //     singular: 'moru',
  //     plural: 'morima',
  //   ),
  //   genitiv: new DeclensionByCount(
  //     singular: 'mora',
  //     plural: 'mora',
  //   ),
  //   vokativ: new DeclensionByCount(
  //     singular: '',
  //     plural: '',
  //   ),
  // ),
  Noun(
    dictionary: 'ljubav',
    tags: [Tags.Emotion],
    gender: Genders.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'ljubav',
      plural: 'ljubavi',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'ljubav',
      plural: 'ljubavi',
    ),
    instrumental: new DeclensionByCount(
      singular: 'ljubavi',
      plural: 'ljubavima',
    ),
    lokativ: new DeclensionByCount(
      singular: 'ljubavi',
      plural: 'ljubavima',
    ),
    dativ: new DeclensionByCount(
      singular: 'ljubavi',
      plural: 'ljubavima',
    ),
    genitiv: new DeclensionByCount(
      singular: 'ljubavi',
      plural: 'ljubavi',
    ),
    vokativ: new DeclensionByCount(
      singular: 'ljubavi',
      plural: 'ljubavi',
    ),
  ),
  Noun(
    dictionary: 'telefon',
    tags: [],
    gender: Genders.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'telefon',
      plural: 'telefoni',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'telefon',
      plural: 'telefone',
    ),
    instrumental: new DeclensionByCount(
      singular: 'telefonom',
      plural: 'telefonima',
    ),
    lokativ: new DeclensionByCount(
      singular: 'telefonu',
      plural: 'telefonima',
    ),
    dativ: new DeclensionByCount(
      singular: 'telefonu',
      plural: 'telefonima',
    ),
    genitiv: new DeclensionByCount(
      singular: 'telefona',
      plural: 'telefona',
    ),
    vokativ: new DeclensionByCount(
      singular: '',
      plural: '',
    ),
  ),
  // Noun(
  //   dictionary: 'čovjek',
  //   tags: [Tags.Human, Tags.Adult],
  //   gender: GenderEnum.Masculine,
  //   isAnimate: true,
  //   nominativ: new DeclensionByCount(
  //     singular: 'čovjek',
  //     plural: 'ljudi',
  //   ),
  //   akuzativ: new DeclensionByCount(
  //     singular: 'čovjeka',
  //     plural: 'ljude',
  //   ),
  //   instrumental: new DeclensionByCount(
  //     singular: 'čovjekom',
  //     plural: 'ljudima',
  //   ),
  //   lokativ: new DeclensionByCount(
  //     singular: 'čovjeku',
  //     plural: 'ljudima',
  //   ),
  //   dativ: new DeclensionByCount(
  //     singular: 'čovjeku',
  //     plural: 'ljudima',
  //   ),
  //   genitiv: new DeclensionByCount(
  //     singular: 'čovjeka',
  //     plural: 'ljudi',
  //   ),
  //   vokativ: new DeclensionByCount(
  //     singular: 'čovječe',
  //     plural: 'ljudi',
  //   ),
  // ),
];
