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
      masculine: new DeclensionByGender(singular: "mog", plural: "mojih"),
      feminine: new DeclensionByGender(singular: "moje", plural: "mojih"),
      neuter: new DeclensionByGender(singular: "moga", plural: "mojih"),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: "", plural: ""),
      feminine: new DeclensionByGender(singular: "", plural: ""),
      neuter: new DeclensionByGender(singular: "", plural: ""),
    ),
  ),
  DeclinableWord(
    dictionary: "tvoj",
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: "tvoj", plural: "tvoji"),
      feminine: new DeclensionByGender(singular: "tvoja", plural: "tvoje"),
      neuter: new DeclensionByGender(singular: "tvoje", plural: "tvoja"),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: "tvoj", plural: "tvoje"),
      feminine: new DeclensionByGender(singular: "tvoju", plural: "tvoje"),
      neuter: new DeclensionByGender(singular: "tvoje", plural: "tvoja"),
    ),
    akuzativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: "tvog", plural: "tvoje"),
      feminine: new DeclensionByGender(singular: "tvoju", plural: "tvoje"),
      neuter: new DeclensionByGender(singular: "tvoje", plural: "tvoja"),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: "tvojim", plural: "tvojim"),
      feminine: new DeclensionByGender(singular: "tvojom", plural: "tvojim"),
      neuter: new DeclensionByGender(singular: "tvojim", plural: "tvojim"),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: "tvom", plural: "tvojim"),
      feminine: new DeclensionByGender(singular: "tvojoj", plural: "tvojim"),
      neuter: new DeclensionByGender(singular: "tvom", plural: "tvojim"),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: "tvom", plural: "tvojim"),
      feminine: new DeclensionByGender(singular: "tvojoj", plural: "tvojim"),
      neuter: new DeclensionByGender(singular: "tvom", plural: "tvojim"),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: "tvog", plural: "tvojih"),
      feminine: new DeclensionByGender(singular: "tvoje", plural: "tvojih"),
      neuter: new DeclensionByGender(singular: "tvoga", plural: "tvojih"),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: "", plural: ""),
      feminine: new DeclensionByGender(singular: "", plural: ""),
      neuter: new DeclensionByGender(singular: "", plural: ""),
    ),
  ),
  DeclinableWord(
    dictionary: "svoj",
    nominativ: new Declension(
      masculine: new DeclensionByGender(singular: "svoj", plural: "svoji"),
      feminine: new DeclensionByGender(singular: "svoja", plural: "svoje"),
      neuter: new DeclensionByGender(singular: "svoje", plural: "svoja"),
    ),
    akuzativ: new Declension(
      masculine: new DeclensionByGender(singular: "svoj", plural: "svoje"),
      feminine: new DeclensionByGender(singular: "svoju", plural: "svoje"),
      neuter: new DeclensionByGender(singular: "svoje", plural: "svoja"),
    ),
    akuzativAnimate: new Declension(
      masculine: new DeclensionByGender(singular: "svojg", plural: "svoje"),
      feminine: new DeclensionByGender(singular: "svoju", plural: "svoje"),
      neuter: new DeclensionByGender(singular: "svoje", plural: "svoja"),
    ),
    instrumental: new Declension(
      masculine: new DeclensionByGender(singular: "svojim", plural: "svojim"),
      feminine: new DeclensionByGender(singular: "svojom", plural: "svojim"),
      neuter: new DeclensionByGender(singular: "svojim", plural: "svojim"),
    ),
    lokativ: new Declension(
      masculine: new DeclensionByGender(singular: "svojm", plural: "svojim"),
      feminine: new DeclensionByGender(singular: "svojoj", plural: "svojim"),
      neuter: new DeclensionByGender(singular: "svojm", plural: "svojim"),
    ),
    dativ: new Declension(
      masculine: new DeclensionByGender(singular: "svojm", plural: "svojim"),
      feminine: new DeclensionByGender(singular: "svojoj", plural: "svojim"),
      neuter: new DeclensionByGender(singular: "svojm", plural: "svojim"),
    ),
    genitiv: new Declension(
      masculine: new DeclensionByGender(singular: "svojg", plural: "svojih"),
      feminine: new DeclensionByGender(singular: "svoje", plural: "svojih"),
      neuter: new DeclensionByGender(singular: "svojga", plural: "svojih"),
    ),
    vokativ: new Declension(
      masculine: new DeclensionByGender(singular: "", plural: ""),
      feminine: new DeclensionByGender(singular: "", plural: ""),
      neuter: new DeclensionByGender(singular: "", plural: ""),
    ),
  ),
];
