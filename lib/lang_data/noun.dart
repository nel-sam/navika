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
      singular: "",
      plural: "",
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
