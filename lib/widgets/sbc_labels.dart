import 'package:navika/models/enums.dart';

class SbcLabels {
  static String cyrillic = 'Ћирилица';

  static String cases = 'Padeži';
  static String verbs = 'Glagoli';
  static String justTables = 'Tabele';
  static String grammarGuide = 'Vodič za gramatiku';
  static String nouns = 'Imenice';
  final DialectType dialect;

  SbcLabels(this.dialect);

  String get adjectives {
    if (dialect == DialectType.Ekavian) return 'Pridevi';

    return 'Pridjevi';
  }

  String get exerciseType {
    if (dialect == DialectType.Ekavian) return 'Vrsta vežbe';
    return 'Vrsta vježbe';
  }

  String get nounsAndAdjectives {
    return "$nouns i $adjectives";
  }

  String get wordOrder {
    if (dialect == DialectType.Ekavian) return 'Red reči';

    return 'Poredak riječi';
  }
}
