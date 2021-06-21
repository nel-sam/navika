import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';

final List<PersonalPronoun> personalPronounWordBank = [
  PersonalPronoun(
    dictionary: 'ja',
    type: PronounEnum.I,
    isPlural: false,
    gender: Genders.Unspecific,
    nominativ: new DeclensionPronoun(
      general: 'ja',
    ),
    genitiv: new DeclensionPronoun(
      general: 'mene',
      shortForm: 'me',
    ),
    dativ: new DeclensionPronoun(
      general: 'meni',
      shortForm: 'mi',
    ),
    akuzativ: new DeclensionPronoun(
      general: 'mene',
      shortForm: 'me',
    ),
    lokativ: new DeclensionPronoun(
      general: 'meni',
      shortForm: 'mi',
    ),
    vokativ: new DeclensionPronoun(
      general: '',
      shortForm: '',
    ),
    instrumental: new DeclensionPronoun(
      general: 'mnom',
    ),
  ),
  // PersonalPronoun(
  //   dictionary: 'ja/mi',
  //   tags: [Tags.PersonalPronoun],
  //   gender: GenderEnum.Unspecific,
  //   isAnimate: false,
  //   nominativ: new DeclensionPronoun(
  //     singular: 'ja',
  //     plural: 'mi',
  //   ),
  //   genitiv: new DeclensionPronoun(
  //     singular: 'mene/me',
  //     plural: 'nas',
  //   ),
  //   dativ: new DeclensionPronoun(
  //     singular: 'mi/meni',
  //     plural: 'nam/nama',
  //   ),
  //   akuzativ: new DeclensionPronoun(
  //     singular: 'mene/me',
  //     plural: 'nas',
  //   ),
  //   lokativ: new DeclensionPronoun(
  //     singular: 'meni',
  //     plural: 'nama',
  //   ),
  //   vokativ: new DeclensionPronoun(
  //     singular: '',
  //     plural: '',
  //   ),
  //   instrumental: new DeclensionPronoun(
  //     singular: 'mnom',
  //     plural: 'nama',
  //   ),
  // ),
  // PersonalPronoun(
  //   dictionary: "ti/vi",
  //   tags: [Tags.PersonalPronoun],
  //   gender: GenderEnum.Unspecific,
  //   isAnimate: false,
  //   nominativ: new DeclensionPronoun(
  //     singular: 'ti',
  //     plural: 'vi',
  //   ),
  //   genitiv: new DeclensionPronoun(
  //     singular: 'tebe/te',
  //     plural: 'vas',
  //   ),
  //   dativ: new DeclensionPronoun(
  //     singular: 'tebi/ti',
  //     plural: 'vam/vama',
  //   ),
  //   akuzativ: new DeclensionPronoun(
  //     singular: 'tebe/te',
  //     plural: 'vas',
  //   ),
  //   lokativ: new DeclensionPronoun(
  //     singular: 'tebi',
  //     plural: 'vama',
  //   ),
  //   vokativ: new DeclensionPronoun(
  //     singular: '',
  //     plural: '',
  //   ),
  //   instrumental: new DeclensionPronoun(
  //     singular: 'tobom',
  //     plural: 'vama',
  //   ),
  // ),
  // PersonalPronoun(
  //   dictionary: "on/oni",
  //   tags: [Tags.PersonalPronoun],
  //   gender: GenderEnum.Masculine,
  //   isAnimate: false,
  //   nominativ: new DeclensionPronoun(
  //     singular: 'on',
  //     plural: 'oni',
  //   ),
  //   genitiv: new DeclensionPronoun(
  //     singular: 'njega',
  //     plural: 'njih',
  //   ),
  //   dativ: new DeclensionPronoun(
  //     singular: 'njumu',
  //     plural: 'njima',
  //   ),
  //   akuzativ: new DeclensionPronoun(
  //     singular: 'njega',
  //     plural: 'njih',
  //   ),
  //   lokativ: new DeclensionPronoun(
  //     singular: 'njemu',
  //     plural: 'njima',
  //   ),
  //   vokativ: new DeclensionPronoun(
  //     singular: '',
  //     plural: '',
  //   ),
  //   instrumental: new DeclensionPronoun(
  //     singular: 'njim',
  //     plural: 'njima',
  //   ),
  // ),
  // PersonalPronoun(
  //   dictionary: "ona/oni",
  //   tags: [Tags.PersonalPronoun],
  //   gender: GenderEnum.Masculine,
  //   isAnimate: false,
  //   nominativ: new DeclensionPronoun(
  //     singular: 'ona',
  //     plural: 'oni',
  //   ),
  //   genitiv: new DeclensionPronoun(
  //     singular: 'nje',
  //     plural: 'njih',
  //   ),
  //   dativ: new DeclensionPronoun(
  //     singular: 'njoj',
  //     plural: 'njima',
  //   ),
  //   akuzativ: new DeclensionPronoun(
  //     singular: 'njega',
  //     plural: 'nju',
  //   ),
  //   lokativ: new DeclensionPronoun(
  //     singular: 'njoj',
  //     plural: 'njima',
  //   ),
  //   vokativ: new DeclensionPronoun(
  //     singular: '',
  //     plural: '',
  //   ),
  //   instrumental: new DeclensionPronoun(
  //     singular: 'njom',
  //     plural: 'njima',
  //   ),
  // ),
];
