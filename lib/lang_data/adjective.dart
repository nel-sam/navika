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
  Adjective(
    dictionary: "hladno",
    nomativ: new Declension(
      masculine: new DeclensionByGender(singular: "hladni", plural: "hladni"),
      feminine: new DeclensionByGender(singular: "hladna", plural: "hladne"),
      neuter: new DeclensionByGender(singular: "hladno", plural: "hladna"),
    ),
    akusativ: new Declension(
      masculine: new DeclensionByGender(singular: "hladni", plural: "hladne"),
      feminine: new DeclensionByGender(singular: "hladnu", plural: "hladne"),
      neuter: new DeclensionByGender(singular: "hladno", plural: "hladna"),
    ),
    akusativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: "hladnog", plural: "hladne"),
      feminine: new DeclensionByGender(singular: "hladnu", plural: "hladne"),
      neuter: new DeclensionByGender(singular: "hladno", plural: "hladnu"),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: "hladnim", plural: "hladnim"),
      feminine: new DeclensionByGender(singular: "hladnom", plural: "hladnim"),
      neuter: new DeclensionByGender(singular: "hladnim", plural: "hladnim"),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: "hladnom", plural: "hladnim"),
      feminine: new DeclensionByGender(singular: "hladnom", plural: "hladnim"),
      neuter: new DeclensionByGender(singular: "hladnom", plural: "hladnim"),
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
  Adjective(
    dictionary: "vruće",
    nomativ: new Declension(
      masculine: new DeclensionByGender(singular: "vrući", plural: "vrući"),
      feminine: new DeclensionByGender(singular: "vruća", plural: "vruće"),
      neuter: new DeclensionByGender(singular: "vruće", plural: "vruća"),
    ),
    akusativ: new Declension(
      masculine: new DeclensionByGender(singular: "vrući", plural: "vruće"),
      feminine: new DeclensionByGender(singular: "vruću", plural: "vruće"),
      neuter: new DeclensionByGender(singular: "vruće", plural: "vruće"),
    ),
    akusativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: "vrućeg", plural: "vruće"),
      feminine: new DeclensionByGender(singular: "vruću", plural: "vruće"),
      neuter: new DeclensionByGender(singular: "vrućo", plural: "vruću"),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: "vrućim", plural: "vrućim"),
      feminine: new DeclensionByGender(singular: "vrućom", plural: "vrućim"),
      neuter: new DeclensionByGender(singular: "vrućim", plural: "vrućim"),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: "vrućem", plural: "vrućim"),
      feminine: new DeclensionByGender(singular: "vrućoj", plural: "vrućim"),
      neuter: new DeclensionByGender(singular: "vrućem", plural: "vrućim"),
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
