import 'package:navika/utilities/widget-helpers.dart';

class WordBank {
  final List<Noun> nouns;
  final List<DeclinableWord> adjectives;
  final List<DeclinableWord> possesivePronouns;

  WordBank(
      {required this.nouns,
      required this.adjectives,
      required this.possesivePronouns});
}

enum GenderEnum { Masculine, Feminine, Neuter }
enum CaseTypeEnum {
  Instrumental,
  Nominativ,
  Akuzativ,
  Vokativ,
  Lokativ,
  Genitiv,
  Dativ,
}

class Noun {
  final GenderEnum gender;
  final bool isAnimate;
  final String dictionary;
  final DeclensionByCount nominativ;
  final DeclensionByCount akuzativ;
  final DeclensionByCount instrumental;
  final DeclensionByCount lokativ;
  final DeclensionByCount dativ;
  final DeclensionByCount genitiv;
  final DeclensionByCount vokativ;

  Noun({
    required this.dictionary,
    required this.gender,
    required this.isAnimate,
    required this.nominativ,
    required this.akuzativ,
    required this.instrumental,
    required this.lokativ,
    required this.dativ,
    required this.genitiv,
    required this.vokativ,
  });

  String getDeclension(bool isPlural, CaseTypeEnum caseType) {
    DeclensionByCount declension;

    switch (caseType) {
      case CaseTypeEnum.Akuzativ:
        declension = this.akuzativ;
        break;
      case CaseTypeEnum.Dativ:
        declension = this.dativ;
        break;
      case CaseTypeEnum.Genitiv:
        declension = this.genitiv;
        break;
      case CaseTypeEnum.Instrumental:
        declension = this.instrumental;
        break;
      case CaseTypeEnum.Lokativ:
        declension = this.lokativ;
        break;
      case CaseTypeEnum.Nominativ:
        declension = this.nominativ;
        break;
      case CaseTypeEnum.Vokativ:
        declension = this.vokativ;
        break;
    }

    return isPlural ? declension.plural : declension.singular;
  }

  List getUniqueDeclensions() {
    return WidgetHelpers.shuffleList([
      this.dictionary,
      this.nominativ.singular,
      this.akuzativ.singular,
      this.instrumental.singular,
      this.lokativ.singular,
      this.dativ.singular,
      this.genitiv.singular,
      this.vokativ.singular,
      this.nominativ.plural,
      this.akuzativ.plural,
      this.instrumental.plural,
      this.lokativ.plural,
      this.dativ.plural,
      this.genitiv.plural,
      this.vokativ.plural,
    ].toSet().toList().where((element) => element.length > 0).toList());
  }
}

class DeclinableWord {
  final String dictionary;
  final Declension nominativ;
  final Declension akuzativ;
  final Declension akuzativAnimate;
  final Declension instrumental;
  final Declension lokativ;
  final Declension dativ;
  final Declension genitiv;
  final Declension vokativ;

  DeclinableWord({
    required this.dictionary,
    required this.nominativ,
    required this.akuzativ,
    required this.akuzativAnimate,
    required this.instrumental,
    required this.lokativ,
    required this.dativ,
    required this.genitiv,
    required this.vokativ,
  });

  List getUniqueDeclensions() {
    return WidgetHelpers.shuffleList([
      this.dictionary,
      this.nominativ.masculine.singular,
      this.nominativ.feminine.singular,
      this.nominativ.neuter.singular,
      this.akuzativ.masculine.singular,
      this.akuzativ.feminine.singular,
      this.akuzativ.neuter.singular,
      this.akuzativAnimate.masculine.singular,
      this.akuzativAnimate.feminine.singular,
      this.akuzativAnimate.neuter.singular,
      this.instrumental.masculine.singular,
      this.instrumental.feminine.singular,
      this.instrumental.neuter.singular,
      this.lokativ.masculine.singular,
      this.lokativ.feminine.singular,
      this.lokativ.neuter.singular,
      this.dativ.masculine.singular,
      this.dativ.feminine.singular,
      this.dativ.neuter.singular,
      this.genitiv.masculine.singular,
      this.genitiv.feminine.singular,
      this.genitiv.neuter.singular,
      this.vokativ.masculine.singular,
      this.vokativ.feminine.singular,
      this.vokativ.neuter.singular,
      this.nominativ.masculine.plural,
      this.nominativ.feminine.plural,
      this.nominativ.neuter.plural,
      this.akuzativ.masculine.plural,
      this.akuzativ.feminine.plural,
      this.akuzativ.neuter.plural,
      this.akuzativAnimate.masculine.plural,
      this.akuzativAnimate.feminine.plural,
      this.akuzativAnimate.neuter.plural,
      this.instrumental.masculine.plural,
      this.instrumental.feminine.plural,
      this.instrumental.neuter.plural,
      this.lokativ.masculine.plural,
      this.lokativ.feminine.plural,
      this.lokativ.neuter.plural,
      this.dativ.masculine.plural,
      this.dativ.feminine.plural,
      this.dativ.neuter.plural,
      this.genitiv.masculine.plural,
      this.genitiv.feminine.plural,
      this.genitiv.neuter.plural,
      this.vokativ.masculine.plural,
      this.vokativ.feminine.plural,
      this.vokativ.neuter.plural,
    ].toSet().toList().where((element) => element.length > 0).toList());
  }

  String getDeclension(
      GenderEnum gender, bool isPlural, CaseTypeEnum caseType, bool isAnimate) {
    Declension declension;

    switch (caseType) {
      case CaseTypeEnum.Akuzativ:
        declension = isAnimate ? this.akuzativAnimate : this.akuzativ;
        break;
      case CaseTypeEnum.Dativ:
        declension = this.dativ;
        break;
      case CaseTypeEnum.Genitiv:
        declension = this.genitiv;
        break;
      case CaseTypeEnum.Instrumental:
        declension = this.instrumental;
        break;
      case CaseTypeEnum.Lokativ:
        declension = this.lokativ;
        break;
      case CaseTypeEnum.Nominativ:
        declension = this.nominativ;
        break;
      case CaseTypeEnum.Vokativ:
        declension = this.vokativ;
        break;
    }

    if (gender == GenderEnum.Masculine) {
      return isPlural
          ? declension.masculine.plural
          : declension.masculine.singular;
    } else if (gender == GenderEnum.Feminine) {
      return isPlural
          ? declension.feminine.plural
          : declension.feminine.singular;
    } else {
      return isPlural ? declension.neuter.plural : declension.neuter.singular;
    }
  }
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
