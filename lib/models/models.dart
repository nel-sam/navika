import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'enums.dart';

class WordBank {
  final List<Noun> nouns;
  final List<Adjective> adjectives;
  final List<Adjective> possesivePronouns;
  final List<PersonalPronoun> personalPronouns;

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

class DeclensionPronoun {
  final String general;
  late String shortForm;

  DeclensionPronoun({
    required this.general,
    this.shortForm = '',
  }) {
    if (this.shortForm == '') {
      this.shortForm = this.general;
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

class PANExerciseItem {
  String sentenceStarter;
  String sentenceEnder;
  Noun? noun;
  Adjective? pronoun;
  Adjective? adjective;
  PersonalPronoun? personalPronoun;
  Genders gender;
  bool isPlural;

  PANExerciseItem({
    required this.sentenceStarter,
    this.sentenceEnder = '',
    this.noun,
    this.pronoun,
    this.adjective,
    this.personalPronoun,
    required this.gender,
    required this.isPlural,
  });
}

class StaticSentenceParts {
  final String start;
  final String end;

  StaticSentenceParts({this.start = '', this.end = ''});
}
