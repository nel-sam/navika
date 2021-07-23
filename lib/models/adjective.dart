import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/extensions.dart';

class Adjective {
  final String dictionary;
  final Declension nominativ;
  final Declension akuzativ;
  final Declension akuzativAnimate;
  final Declension instrumental;
  final Declension lokativ;
  final Declension dativ;
  final Declension genitiv;
  final Declension vokativ;

  Adjective({
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

  List<String> getUniqueDeclensions({bool shuffle = false}) {
    var result = [
      this.dictionary,
      ...this.nominativ.masculine.singular,
      ...this.nominativ.feminine.singular,
      ...this.nominativ.neuter.singular,
      ...this.akuzativ.masculine.singular,
      ...this.akuzativ.feminine.singular,
      ...this.akuzativ.neuter.singular,
      ...this.akuzativAnimate.masculine.singular,
      ...this.akuzativAnimate.feminine.singular,
      ...this.akuzativAnimate.neuter.singular,
      ...this.instrumental.masculine.singular,
      ...this.instrumental.feminine.singular,
      ...this.instrumental.neuter.singular,
      ...this.lokativ.masculine.singular,
      ...this.lokativ.feminine.singular,
      ...this.lokativ.neuter.singular,
      ...this.dativ.masculine.singular,
      ...this.dativ.feminine.singular,
      ...this.dativ.neuter.singular,
      ...this.genitiv.masculine.singular,
      ...this.genitiv.feminine.singular,
      ...this.genitiv.neuter.singular,
      ...this.vokativ.masculine.singular,
      ...this.vokativ.feminine.singular,
      ...this.vokativ.neuter.singular,
      ...this.nominativ.masculine.plural,
      ...this.nominativ.feminine.plural,
      ...this.nominativ.neuter.plural,
      ...this.akuzativ.masculine.plural,
      ...this.akuzativ.feminine.plural,
      ...this.akuzativ.neuter.plural,
      ...this.akuzativAnimate.masculine.plural,
      ...this.akuzativAnimate.feminine.plural,
      ...this.akuzativAnimate.neuter.plural,
      ...this.instrumental.masculine.plural,
      ...this.instrumental.feminine.plural,
      ...this.instrumental.neuter.plural,
      ...this.lokativ.masculine.plural,
      ...this.lokativ.feminine.plural,
      ...this.lokativ.neuter.plural,
      ...this.dativ.masculine.plural,
      ...this.dativ.feminine.plural,
      ...this.dativ.neuter.plural,
      ...this.genitiv.masculine.plural,
      ...this.genitiv.feminine.plural,
      ...this.genitiv.neuter.plural,
      ...this.vokativ.masculine.plural,
      ...this.vokativ.feminine.plural,
      ...this.vokativ.neuter.plural,
    ].toSet().toList().where((element) => element.length > 0).toList();

    return shuffle ? result.shuffleStrings() : result;
  }

  Declension getDeclensionObject(Cases caseType, bool isAnimate) {
    switch (caseType) {
      case Cases.Aku:
        return isAnimate ? this.akuzativAnimate : this.akuzativ;
      case Cases.Dat:
        return this.dativ;
      case Cases.Gen:
        return this.genitiv;
      case Cases.Ins:
        return this.instrumental;
      case Cases.Lok:
        return this.lokativ;
      case Cases.Nom:
      case Cases.All:
        return this.nominativ;
      case Cases.Vok:
        return this.vokativ;
    }
  }

  List<String> getDeclensions(
      Genders gender, bool isPlural, Cases caseType, bool isAnimate) {
    Declension declension;

    switch (caseType) {
      case Cases.Aku:
        declension = isAnimate ? this.akuzativAnimate : this.akuzativ;
        break;
      case Cases.Dat:
        declension = this.dativ;
        break;
      case Cases.Gen:
        declension = this.genitiv;
        break;
      case Cases.Ins:
        declension = this.instrumental;
        break;
      case Cases.Lok:
        declension = this.lokativ;
        break;
      case Cases.Nom:
      case Cases.All:
        declension = this.nominativ;
        break;
      case Cases.Vok:
        declension = this.vokativ;
        break;
    }

    if (gender == Genders.Masculine) {
      return isPlural
          ? declension.masculine.plural
          : declension.masculine.singular;
    } else if (gender == Genders.Feminine) {
      return isPlural
          ? declension.feminine.plural
          : declension.feminine.singular;
    } else {
      return isPlural ? declension.neuter.plural : declension.neuter.singular;
    }
  }

  List<String> getDeclensionsForCaseType(Cases caseType) {
    switch (caseType) {
      case Cases.Ins:
        return this.instrumental.getAll();
      case Cases.Nom:
      case Cases.All:
        return this.nominativ.getAll();
      case Cases.Aku:
        return [...this.akuzativ.getAll(), ...this.akuzativAnimate.getAll()];
      case Cases.Vok:
        return this.vokativ.getAll();
      case Cases.Lok:
        return this.lokativ.getAll();
      case Cases.Gen:
        return this.genitiv.getAll();
      case Cases.Dat:
        return this.dativ.getAll();
    }
  }

  int longestForCase(Cases caseType) {
    int longestFound = 0;

    this.getDeclensionsForCaseType(caseType).forEach((d) {
      if (d.length > longestFound) {
        longestFound = d.length;
      }
    });

    return longestFound;
  }

  getDropDownInitial(Cases caseType) {
    final toAvoid = getDeclensionsForCaseType(caseType);
    final filtered = getUniqueDeclensions(shuffle: true);
    filtered.removeWhere((element) => toAvoid.contains(element));
    return filtered.last;
  }
}
