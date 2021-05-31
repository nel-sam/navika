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
    nomativ: new DeclensionByCount(
      singular: "stol",
      plural: "stolovi",
    ),
    akusativ: new DeclensionByCount(
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
    nomativ: new DeclensionByCount(
      singular: "žena",
      plural: "žene",
    ),
    akusativ: new DeclensionByCount(
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
    nomativ: new DeclensionByCount(
      singular: "more",
      plural: "mora",
    ),
    akusativ: new DeclensionByCount(
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
