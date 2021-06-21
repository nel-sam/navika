import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';

final List<Noun> personalPronounWordBank = [
  Noun(
    dictionary: 'ja/mi',
    tags: [Tags.PersonalPronoun],
    gender: GenderEnum.Unspecific,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'ja',
      plural: 'mi',
    ),
    genitiv: new DeclensionByCount(
      singular: 'mene/me',
      plural: 'nas',
    ),
    dativ: new DeclensionByCount(
      singular: 'mi/meni',
      plural: 'nam/nama',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'mene/me',
      plural: 'nas',
    ),
    lokativ: new DeclensionByCount(
      singular: 'meni',
      plural: 'nama',
    ),
    vokativ: new DeclensionByCount(
      singular: '',
      plural: '',
    ),
    instrumental: new DeclensionByCount(
      singular: 'mnom',
      plural: 'nama',
    ),
  ),
  Noun(
    dictionary: "ti/vi",
    tags: [Tags.PersonalPronoun],
    gender: GenderEnum.Unspecific,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'ti',
      plural: 'vi',
    ),
    genitiv: new DeclensionByCount(
      singular: 'tebe/te',
      plural: 'vas',
    ),
    dativ: new DeclensionByCount(
      singular: 'tebi/ti',
      plural: 'vam/vama',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'tebe/te',
      plural: 'vas',
    ),
    lokativ: new DeclensionByCount(
      singular: 'tebi',
      plural: 'vama',
    ),
    vokativ: new DeclensionByCount(
      singular: '',
      plural: '',
    ),
    instrumental: new DeclensionByCount(
      singular: 'tobom',
      plural: 'vama',
    ),
  ),
  Noun(
    dictionary: "on/oni",
    tags: [Tags.PersonalPronoun],
    gender: GenderEnum.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'on',
      plural: 'oni',
    ),
    genitiv: new DeclensionByCount(
      singular: 'njega',
      plural: 'njih',
    ),
    dativ: new DeclensionByCount(
      singular: 'njumu',
      plural: 'njima',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'njega',
      plural: 'njih',
    ),
    lokativ: new DeclensionByCount(
      singular: 'njemu',
      plural: 'njima',
    ),
    vokativ: new DeclensionByCount(
      singular: '',
      plural: '',
    ),
    instrumental: new DeclensionByCount(
      singular: 'njim',
      plural: 'njima',
    ),
  ),
  Noun(
    dictionary: "ona/oni",
    tags: [Tags.PersonalPronoun],
    gender: GenderEnum.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: 'ona',
      plural: 'oni',
    ),
    genitiv: new DeclensionByCount(
      singular: 'nje',
      plural: 'njih',
    ),
    dativ: new DeclensionByCount(
      singular: 'njoj',
      plural: 'njima',
    ),
    akuzativ: new DeclensionByCount(
      singular: 'njega',
      plural: 'nju',
    ),
    lokativ: new DeclensionByCount(
      singular: 'njoj',
      plural: 'njima',
    ),
    vokativ: new DeclensionByCount(
      singular: '',
      plural: '',
    ),
    instrumental: new DeclensionByCount(
      singular: 'njom',
      plural: 'njima',
    ),
  ),
];
