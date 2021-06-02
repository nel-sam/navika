import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

/*
new DeclensionByCount(
      singular: "",
      plural: "",
    ),
*/

final List<Noun> nounWordBank = [
  Noun(
    dictionary: "stol",
    category: WordCategoryEnum.FlatSurface,
    gender: GenderEnum.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: "stol",
      plural: "stolovi",
    ),
    akuzativ: new DeclensionByCount(
      singular: "stol",
      plural: "stolove",
    ),
    instrumental: new DeclensionByCount(
      singular: "stolom",
      plural: "stolovima",
    ),
    lokativ: new DeclensionByCount(
      singular: "stolu",
      plural: "stolovima",
    ),
    dativ: new DeclensionByCount(
      singular: "stolu",
      plural: "stolovima",
    ),
    genitiv: new DeclensionByCount(
      singular: "stola",
      plural: "stolova",
    ),
    vokativ: new DeclensionByCount(
      singular: "stole",
      plural: "stolovi",
    ),
  ),
  Noun(
    dictionary: "žena",
    category: WordCategoryEnum.Human,
    gender: GenderEnum.Feminine,
    isAnimate: true,
    nominativ: new DeclensionByCount(
      singular: "žena",
      plural: "žene",
    ),
    akuzativ: new DeclensionByCount(
      singular: "ženu",
      plural: "žene",
    ),
    instrumental: new DeclensionByCount(
      singular: "ženom",
      plural: "ženama",
    ),
    lokativ: new DeclensionByCount(
      singular: "ženi",
      plural: "ženama",
    ),
    dativ: new DeclensionByCount(
      singular: "ženi",
      plural: "ženama",
    ),
    genitiv: new DeclensionByCount(
      singular: "žene",
      plural: "žena",
    ),
    vokativ: new DeclensionByCount(
      singular: "ženo",
      plural: "žene",
    ),
  ),
  Noun(
    dictionary: "more",
    category: WordCategoryEnum.Location,
    gender: GenderEnum.Neuter,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: "more",
      plural: "mora",
    ),
    akuzativ: new DeclensionByCount(
      singular: "more",
      plural: "mora",
    ),
    instrumental: new DeclensionByCount(
      singular: "morem",
      plural: "morima",
    ),
    lokativ: new DeclensionByCount(
      singular: "moru",
      plural: "morima",
    ),
    dativ: new DeclensionByCount(
      singular: "moru",
      plural: "morima",
    ),
    genitiv: new DeclensionByCount(
      singular: "more",
      plural: "mora",
    ),
    vokativ: new DeclensionByCount(
      singular: "moro",
      plural: "more",
    ),
  ),
  Noun(
    dictionary: "ljubav",
    category: WordCategoryEnum.Emotion,
    gender: GenderEnum.Feminine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: "ljubav",
      plural: "ljubavi",
    ),
    akuzativ: new DeclensionByCount(
      singular: "ljubav",
      plural: "ljubavi",
    ),
    instrumental: new DeclensionByCount(
      singular: "ljubavi",
      plural: "ljubavima",
    ),
    lokativ: new DeclensionByCount(
      singular: "ljubavi",
      plural: "ljubavima",
    ),
    dativ: new DeclensionByCount(
      singular: "ljubavi",
      plural: "ljubavima",
    ),
    genitiv: new DeclensionByCount(
      singular: "ljubavi",
      plural: "ljubavi",
    ),
    vokativ: new DeclensionByCount(
      singular: "ljubavi",
      plural: "ljubavi",
    ),
  ),
];
