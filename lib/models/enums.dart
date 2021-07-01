enum EntryTypes {
  FreeForm,
  Select,
  Mixed,
}

enum Genders {
  Masculine,
  Feminine,
  Neuter,
  Unspecific,
}

enum CaseTypeEnum {
  Instrumental,
  Nominativ,
  Akuzativ,
  Vokativ,
  Lokativ,
  Genitiv,
  Dativ,
}

enum Tags {
  NaturalFeature,
  FlatSurface,
  Instrument,
  WorkPlace,
  Furniture,
  BodyPart,
  Portable,
  Location,
  Alcohol,
  Activity,
  Vehicle,
  Emotion,
  Country,
  Weather,
  Health,
  Season,
  Animal,
  Adult,
  Drink,
  Thing,
  Human,
  Group,
  Food,
  Pet,
}

enum TenseEnum {
  Conditional,
  Present,
  Future,
  Past,
}

enum PronounEnum {
  I,
  You,
  He,
  She,
  We,
  You_Plural,
  They_Ungendered,
  They_Masc,
  They_Fem,
  Oneself,
}

const CaseImagePaths = <CaseTypeEnum, String>{
  CaseTypeEnum.Nominativ: 'assets/banners/seaside_city.jpg',
  CaseTypeEnum.Akuzativ: 'assets/banners/pay.jpg',
  CaseTypeEnum.Instrumental: 'assets/banners/vespa.jpg',
  CaseTypeEnum.Lokativ: 'assets/banners/ladies.jpg',
  CaseTypeEnum.Dativ: 'assets/banners/giving.jpg',
  CaseTypeEnum.Genitiv: 'assets/banners/bosna.jpg',
};
