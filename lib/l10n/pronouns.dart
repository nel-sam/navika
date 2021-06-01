import 'package:navika/models/models.dart';

final List<DeclinableWord> pronounWordBank = [
  DeclinableWord(
    dictionary: "moj",
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: "moj", plural: "moji"),
      feminine: new DeclensionByGender(singular: "moja", plural: "moje"),
      neuter: new DeclensionByGender(singular: "moje", plural: "moja"),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: "moj", plural: "moje"),
      feminine: new DeclensionByGender(singular: "moju", plural: "moje"),
      neuter: new DeclensionByGender(singular: "moje", plural: "moja"),
    ),
    akuzativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: "mog", plural: "moje"),
      feminine: new DeclensionByGender(singular: "moju", plural: "moje"),
      neuter: new DeclensionByGender(singular: "moje", plural: "moja"),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: "mojim", plural: "mojim"),
      feminine: new DeclensionByGender(singular: "mojom", plural: "mojim"),
      neuter: new DeclensionByGender(singular: "mojim", plural: "mojim"),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: "mom", plural: "mojim"),
      feminine: new DeclensionByGender(singular: "mojoj", plural: "mojim"),
      neuter: new DeclensionByGender(singular: "mom", plural: "mojim"),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: "mom", plural: "mojim"),
      feminine: new DeclensionByGender(singular: "mojoj", plural: "mojim"),
      neuter: new DeclensionByGender(singular: "mom", plural: "mojim"),
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
