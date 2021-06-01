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
      singular: "",
      plural: "",
    ),
    vokativ: new DeclensionByCount(
      singular: "",
      plural: "",
    ),
  ),
  Noun(
    dictionary: "žena",
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
      singular: "",
      plural: "",
    ),
    vokativ: new DeclensionByCount(
      singular: "",
      plural: "",
    ),
  ),
  Noun(
    dictionary: "more",
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
      singular: "",
      plural: "",
    ),
    vokativ: new DeclensionByCount(
      singular: "",
      plural: "",
    ),
  ),
];
