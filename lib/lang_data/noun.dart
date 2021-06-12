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
    tags: [
      Tags.FlatSurface,
      Tags.Furniture,
      Tags.Portable,
    ],
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
    tags: [
      Tags.Human,
      Tags.Adult,
    ],
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
    dictionary: "muškarac",
    tags: [
      Tags.Human,
      Tags.Adult,
    ],
    gender: GenderEnum.Masculine,
    isAnimate: true,
    nominativ: new DeclensionByCount(
      singular: "muškarac",
      plural: "muškarci",
    ),
    akuzativ: new DeclensionByCount(
      singular: "muškarac",
      plural: "muškarce",
    ),
    instrumental: new DeclensionByCount(
      singular: "muškarcem",
      plural: "muškarcima",
    ),
    lokativ: new DeclensionByCount(
      singular: "muškarcu",
      plural: "muškarcima",
    ),
    dativ: new DeclensionByCount(
      singular: "muškarca",
      plural: "muškarcima",
    ),
    genitiv: new DeclensionByCount(
      singular: "muškarca",
      plural: "muškaraca",
    ),
    vokativ: new DeclensionByCount(
      singular: "",
      plural: "",
    ),
  ),
  Noun(
    dictionary: "more",
    tags: [
      Tags.Location,
      Tags.NaturalFeature,
    ],
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
    tags: [Tags.Emotion],
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
  Noun(
    dictionary: "telefon",
    tags: [],
    gender: GenderEnum.Masculine,
    isAnimate: false,
    nominativ: new DeclensionByCount(
      singular: "telefon",
      plural: "telefoni",
    ),
    akuzativ: new DeclensionByCount(
      singular: "telefon",
      plural: "telefone",
    ),
    instrumental: new DeclensionByCount(
      singular: "telefonom",
      plural: "telefonima",
    ),
    lokativ: new DeclensionByCount(
      singular: "telefonu",
      plural: "telefonima",
    ),
    dativ: new DeclensionByCount(
      singular: "telefonu",
      plural: "telefonima",
    ),
    genitiv: new DeclensionByCount(
      singular: "telefona",
      plural: "telefona",
    ),
    vokativ: new DeclensionByCount(
      singular: "",
      plural: "",
    ),
  ),
];
