import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'enums.dart';

class SettingsSet {
  final EntryTypes entryType;
  final bool possessivePronounsIncluded;
  final bool personalPronounsIncluded;
  final bool adjectivesIncluded;
  final bool nounsIncluded;

  SettingsSet({
    this.entryType = EntryTypes.FreeForm,
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

  WordBank filter(SettingsSet settingsSet) {
    var result = WordBank(
      nouns: settingsSet.nounsIncluded ? [...this.nouns] : [],
      adjectives: settingsSet.adjectivesIncluded ? [...this.adjectives] : [],
      possessivePronouns: settingsSet.possessivePronounsIncluded
          ? [...this.possessivePronouns]
          : [],
      personalPronouns: settingsSet.personalPronounsIncluded
          ? [...this.personalPronouns]
          : [],
    );

    return result;
  }

  WordBank excludePronoun(String toFilter) {
    var result = WordBank(
      nouns: [...this.nouns],
      adjectives: [...this.adjectives],
      possessivePronouns: [...this.possessivePronouns],
      personalPronouns: [...this.personalPronouns],
    );

    final svoj = result.possessivePronouns
        .firstWhere((e) => e.nominativ.masculine.singular.first == toFilter);
    result.possessivePronouns.remove(svoj);

    return result;
  }

  WordBank excludeNounsByTags(List<Tags> tagsToFilter) {
    var result = WordBank(
      nouns: [
        ...this.nouns.where((n) => !listsShareElements(tagsToFilter, n.tags))
      ],
      adjectives: [...this.adjectives],
      possessivePronouns: [...this.possessivePronouns],
      personalPronouns: [...this.personalPronouns],
    );

    return result;
  }

  bool listsShareElements(List<Tags> list1, List<Tags> list2) {
    var contains = false;

    for (int i = 0; i < list1.length; i++) {
      final Tags toFilter = list1[i];

      if (list2.contains(toFilter)) {
        contains = true;
        break;
      }
    }

    return contains;
  }
}

class DeclensionPronoun {
  final List<String> forms;
  //late String shortForm;

  DeclensionPronoun({
    required this.forms,
    //this.shortForm = '',
  }) {
    // if (this.shortForm == '') {
    //   this.shortForm = this.general;
    //}
  }
}

class DeclensionByCount {
  final List<String> singular;
  final List<String> plural;

  DeclensionByCount({
    required this.singular,
    required this.plural,
  });

  List<String> getAll() {
    return [...this.singular, ...this.plural];
  }
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

  List<String> getAll() {
    return [
      ...this.feminine.singular,
      ...this.feminine.plural,
      ...this.masculine.singular,
      ...this.masculine.plural,
      ...this.neuter.singular,
      ...this.neuter.plural
    ];
  }
}

class DeclensionByGender {
  final List<String> singular;
  final List<String> plural;

  DeclensionByGender({
    required this.singular,
    required this.plural,
  });
}

class PANStateItem {
  PANCombo combo;

  PANStateItem({required this.combo});
}

class PANCombo {
  String sentenceStarter;
  String sentenceEnder;
  Noun? noun;
  Adjective? pronoun;
  Adjective? adjective;
  PersonalPronoun? personalPronoun;
  bool usePersonalPronounShortForm;
  Genders gender;
  bool isPlural;

  PANCombo({
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
