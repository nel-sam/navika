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

enum Cases {
  Ins,
  Nom,
  Aku,
  Vok,
  Lok,
  Gen,
  Dat,
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

const CaseImagePaths = <Cases, String>{
  Cases.Nom: 'assets/banners/seaside_city.jpg',
  Cases.Aku: 'assets/banners/pay.jpg',
  Cases.Ins: 'assets/banners/vespa.jpg',
  Cases.Lok: 'assets/banners/ladies.jpg',
  Cases.Dat: 'assets/banners/giving.jpg',
  Cases.Gen: 'assets/banners/bosna.jpg',
};
