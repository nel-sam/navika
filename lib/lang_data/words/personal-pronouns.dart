import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';

class PersonalPronounWordBank {
  static final ja = PersonalPronoun(
    dictionary: 'ja',
    type: PronounEnum.I,
    isPlural: false,
    gender: Genders.Unspecific,
    nominativ: new DeclensionPronoun(forms: ['ja']),
    genitiv: new DeclensionPronoun(forms: ['mene']), // 'me' ?
    dativ: new DeclensionPronoun(forms: ['meni', 'mi']),
    akuzativ: new DeclensionPronoun(forms: ['mene', 'me']),
    lokativ: new DeclensionPronoun(forms: ['meni']),
    vokativ: new DeclensionPronoun(forms: ['']),
    instrumental: new DeclensionPronoun(forms: ['mnom']),
  );
  static final ti = PersonalPronoun(
    dictionary: 'ti',
    type: PronounEnum.You,
    isPlural: false,
    gender: Genders.Unspecific,
    nominativ: new DeclensionPronoun(forms: ['ti']),
    genitiv: new DeclensionPronoun(forms: ['tebe']), // 'te' ?
    dativ: new DeclensionPronoun(forms: ['tebi', 'ti']),
    akuzativ: new DeclensionPronoun(forms: ['tebe', 'te']),
    lokativ: new DeclensionPronoun(forms: ['tebi']),
    vokativ: new DeclensionPronoun(forms: ['']),
    instrumental: new DeclensionPronoun(forms: ['tobom']),
  );
  static final on = PersonalPronoun(
    dictionary: 'on',
    type: PronounEnum.He,
    isPlural: false,
    gender: Genders.Masculine,
    nominativ: new DeclensionPronoun(forms: ['on']),
    genitiv: new DeclensionPronoun(forms: ['njega', 'ga']),
    dativ: new DeclensionPronoun(forms: ['njemu', 'mu']),
    akuzativ: new DeclensionPronoun(forms: ['njega', 'ga', 'nj']),
    lokativ: new DeclensionPronoun(forms: ['njemu', 'njem']),
    vokativ: new DeclensionPronoun(forms: ['']),
    instrumental: new DeclensionPronoun(forms: ['njime', 'njim']),
  );
  static final ona = PersonalPronoun(
    dictionary: 'ona',
    type: PronounEnum.She,
    isPlural: false,
    gender: Genders.Feminine,
    nominativ: new DeclensionPronoun(forms: ['ona']),
    genitiv: new DeclensionPronoun(forms: ['nje', 'je']),
    dativ: new DeclensionPronoun(forms: ['njoj', 'joj']),
    akuzativ: new DeclensionPronoun(forms: ['nju', 'ju', 'je']), // TODO: , 'je'
    lokativ: new DeclensionPronoun(forms: ['njoj']),
    vokativ: new DeclensionPronoun(forms: ['']),
    instrumental: new DeclensionPronoun(forms: ['njome', 'njom']),
  );
  static final mi = PersonalPronoun(
    dictionary: 'mi',
    type: PronounEnum.We,
    isPlural: true,
    gender: Genders.Unspecific,
    nominativ: new DeclensionPronoun(forms: ['mi']),
    genitiv: new DeclensionPronoun(forms: ['nas']),
    dativ: new DeclensionPronoun(forms: ['nama', 'nam']),
    akuzativ: new DeclensionPronoun(forms: ['nas']),
    lokativ: new DeclensionPronoun(forms: ['nama']),
    vokativ: new DeclensionPronoun(forms: ['']),
    instrumental: new DeclensionPronoun(forms: ['nama']),
  );

  static final vi = PersonalPronoun(
    dictionary: 'vi',
    type: PronounEnum.You_Plural,
    isPlural: true,
    gender: Genders.Unspecific,
    nominativ: new DeclensionPronoun(forms: ['vi']),
    genitiv: new DeclensionPronoun(forms: ['vas']),
    dativ: new DeclensionPronoun(forms: ['vama', 'vam']),
    akuzativ: new DeclensionPronoun(forms: ['vas']),
    lokativ: new DeclensionPronoun(forms: ['vama']),
    vokativ: new DeclensionPronoun(forms: ['']),
    instrumental: new DeclensionPronoun(forms: ['vama']),
  );

  static final oni = PersonalPronoun(
    dictionary: 'oni',
    type: PronounEnum.They_Ungendered,
    isPlural: true,
    gender: Genders.Unspecific,
    nominativ: new DeclensionPronoun(forms: ['oni']),
    genitiv: new DeclensionPronoun(forms: ['njih', 'ih']),
    dativ: new DeclensionPronoun(forms: ['njima', 'im']),
    akuzativ: new DeclensionPronoun(forms: ['njih', 'ih']),
    lokativ: new DeclensionPronoun(forms: ['njima']),
    vokativ: new DeclensionPronoun(forms: ['']),
    instrumental: new DeclensionPronoun(forms: ['njima', 'im']),
  );
}
