import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'enums.dart';

class ExerciseFilterSet {
  final bool possessivePronounsIncluded;
  final bool personalPronounsIncluded;
  final bool adjectivesIncluded;
  final bool nounsIncluded;

  ExerciseFilterSet({
    this.possessivePronounsIncluded = true,
    this.personalPronounsIncluded = true,
    this.adjectivesIncluded = true,
    this.nounsIncluded = true,
  });
}

class WordBank {
  final List<Noun> nouns;
  final List<Adjective> adjectives;
  final List<Adjective> possessivePronouns;
  final List<PersonalPronoun> personalPronouns;

  WordBank(
      {required this.nouns,
      required this.adjectives,
      required this.possessivePronouns,
      required this.personalPronouns});

  WordBank filter(ExerciseFilterSet filterSet) {
    var result = WordBank(
      nouns: filterSet.nounsIncluded ? [...this.nouns] : [],
      adjectives: filterSet.adjectivesIncluded ? [...this.adjectives] : [],
      possessivePronouns: filterSet.possessivePronounsIncluded
          ? [...this.possessivePronouns]
          : [],
      personalPronouns:
          filterSet.personalPronounsIncluded ? [...this.personalPronouns] : [],
    );

    return result;
  }

  WordBank filterPronoun(String toFilter) {
    var result = WordBank(
      nouns: [...this.nouns],
      adjectives: [...this.adjectives],
      possessivePronouns: [...this.possessivePronouns],
      personalPronouns: [...this.personalPronouns],
    );

    final svoj = result.possessivePronouns
        .firstWhere((e) => e.nominativ.masculine.singular == toFilter);
    result.possessivePronouns.remove(svoj);

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
  bool usePersonalPronounShortForm;
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
    this.usePersonalPronounShortForm = false,
  });
}

class StaticSentenceParts {
  final String start;
  final String end;

  StaticSentenceParts({this.start = '', this.end = ''});
}
