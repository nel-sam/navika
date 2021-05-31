class WordBank {
  final List<Noun> nouns;
  final List<Adjective> adjectives;

  WordBank({required this.nouns, required this.adjectives});
}

enum GenderEnum { Masculine, Feminine, Neuter }

class Noun {
  final GenderEnum gender;
  final bool isAnimate;
  final String dictionary;
  final DeclensionByCount nomativ;
  final DeclensionByCount akusativ;
  final DeclensionByCount instrumental;
  final DeclensionByCount lokativ;
  final DeclensionByCount dativ;
  final DeclensionByCount genitiv;
  final DeclensionByCount vokativ;

  Noun({
    required this.dictionary,
    required this.gender,
    required this.isAnimate,
    required this.nomativ,
    required this.akusativ,
    required this.instrumental,
    required this.lokativ,
    required this.dativ,
    required this.genitiv,
    required this.vokativ,
  });
}

class Adjective {
  final String dictionary;
  final Declension nomativ;
  final Declension akusativ;
  final Declension akusativAnimate;
  final Declension instrumental;
  final Declension lokativ;
  final Declension dativ;
  final Declension genitiv;
  final Declension vokativ;

  Adjective({
    required this.dictionary,
    required this.nomativ,
    required this.akusativ,
    required this.akusativAnimate,
    required this.instrumental,
    required this.lokativ,
    required this.dativ,
    required this.genitiv,
    required this.vokativ,
  });
}

class DeclensionByCount {
  final String singular;
  final String plural;

  DeclensionByCount({
    required this.singular,
    required this.plural,
  });
}

class Declension {
  final DeclensionByGender masculine;
  final DeclensionByGender feminine;
  final DeclensionByGender neuter;

  Declension({
    required this.masculine,
    required this.feminine,
    required this.neuter,
  });
}

class DeclensionByGender {
  final String singular;
  final String plural;

  DeclensionByGender({
    required this.singular,
    required this.plural,
  });
}
