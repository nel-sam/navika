import 'package:navika/models/models.dart';

/*
    new Declension(
      masculine: new DeclensionByGender(singular: "", plural: ""),
      feminine: new DeclensionByGender(singular: "", plural: ""),
      neuter: new DeclensionByGender(singular: "", plural: ""),
    )
*/

final List<Adjective> adjectiveWordBank = [
  Adjective(
    dictionary: "velik",
    nomativ: new Declension(
      masculine: new DeclensionByGender(singular: "veliki", plural: "veliki"),
      feminine: new DeclensionByGender(singular: "velika", plural: "velike"),
      neuter: new DeclensionByGender(singular: "veliko", plural: "velika"),
    ),
    akusativ: new Declension(
      masculine: new DeclensionByGender(singular: "veliki", plural: "velike"),
      feminine: new DeclensionByGender(singular: "veliku", plural: "velike"),
      neuter: new DeclensionByGender(singular: "veliko", plural: "velika"),
    ),
    akusativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: "velikog", plural: "velike"),
      feminine: new DeclensionByGender(singular: "veliku", plural: "velike"),
      neuter: new DeclensionByGender(singular: "veliko", plural: "veliku"),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: "velikim", plural: "velikim"),
      feminine: new DeclensionByGender(singular: "velikom", plural: "velikim"),
      neuter: new DeclensionByGender(singular: "velikim", plural: "velikim"),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: "velikom", plural: "velikim"),
      feminine: new DeclensionByGender(singular: "velikom", plural: "velikim"),
      neuter: new DeclensionByGender(singular: "velikom", plural: "velikim"),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: "", plural: ""),
      feminine: new DeclensionByGender(singular: "", plural: ""),
      neuter: new DeclensionByGender(singular: "", plural: ""),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: "", plural: ""),
      feminine: new DeclensionByGender(singular: "", plural: ""),
      neuter: new DeclensionByGender(singular: "", plural: ""),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: "", plural: ""),
      feminine: new DeclensionByGender(singular: "", plural: ""),
      neuter: new DeclensionByGender(singular: "", plural: ""),
    ),
  ),
];
