import 'package:navika/models/enums.dart';

class SbcLabels {
  static String cyrillic = 'Ћирилица';

  static String cases = 'Padeži';
  static String verbs = 'Glagoli';
  static String justTables = 'Tabele';
  static String grammarGuide = 'Vodič za gramatiku';
  static String declensionGuide = 'Vodič za padeži';
  static String nouns = 'Imenice';
  static String numbers = 'Brojevi';
  static String ordinalNumbers = 'Redni brojevi';
  static String counting = 'Brojanje'; // TODO: Confirm this is correct
  final DialectType dialect;

  SbcLabels(this.dialect);

  String get adjectives {
    if (dialect == DialectType.Serbia) return 'Pridevi';

    return 'Pridjevi';
  }

  String get exerciseType {
    if (dialect == DialectType.Serbia) return 'Vrsta vežbe';
    return 'Vrsta vježbe';
  }

  String get nounsAndAdjectives {
    return "$nouns i $adjectives";
  }

  String get personalPronouns {
    if (dialect == DialectType.Serbia) return 'Lične Zamenice';

    return 'Osobne Zamjenice';
  }

  String get wordOrder {
    if (dialect == DialectType.Serbia) return 'Red reči';

    return 'Poredak riječi';
  }
}
