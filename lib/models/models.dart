import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'enums.dart';

class WordBank {
  final List<Noun> nouns;
  final List<Adjective> adjectives;
  final List<Adjective> possesivePronouns;
  final List<Noun> personalPronouns;

  WordBank(
      {required this.nouns,
      required this.adjectives,
      required this.possesivePronouns,
      required this.personalPronouns});

  WordBank filterPronoun(String toFilter) {
    var result = WordBank(
      nouns: [...this.nouns],
      adjectives: [...this.adjectives],
      possesivePronouns: [...this.possesivePronouns],
      personalPronouns: [...this.personalPronouns],
    );

    final svoj = result.possesivePronouns
        .firstWhere((e) => e.nominativ.masculine.singular == toFilter);
    result.possesivePronouns.remove(svoj);

    return result;
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

class PANExerciseItem {
  String sentenceStarter;
  String sentenceEnder;
  Adjective? pronoun;
  Adjective? adjective;
  GenderEnum gender;
  bool isPlural;
  Noun noun;

  PANExerciseItem({
    required this.sentenceStarter,
    required this.sentenceEnder,
    this.pronoun,
    this.adjective,
    required this.gender,
    required this.isPlural,
    required this.noun,
  });
}

class StaticSentenceParts {
  final String start;
  final String end;

  StaticSentenceParts({this.start = '', this.end = ''});
}
