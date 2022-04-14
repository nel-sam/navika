import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';

import 'enums.dart';

class Declension {
  final DeclensionByGender masculine;
  late DeclensionByGender? feminine;
  late DeclensionByGender? neuter;

  Declension({
    required this.masculine,
    this.feminine,
    this.neuter,
  }) {
    if (this.feminine == null) this.feminine = this.masculine;
    if (this.neuter == null) this.neuter = this.masculine;
  }

  List<String> getAll() {
    return [
      ...this.feminine!.singular,
      ...this.feminine!.plural,
      ...this.masculine.singular,
      ...this.masculine.plural,
      ...this.neuter!.singular,
      ...this.neuter!.plural
    ];
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
    var result = [...this.singular, ...this.plural];
    result.removeWhere((element) => element == '');
    return result;
  }
}

class DeclensionByGender {
  List<String> singular;
  List<String> plural;

  DeclensionByGender({
    this.singular = const [],
    this.plural = const [],
  });
}

class DeclensionPronoun {
  final List<String> forms;

  DeclensionPronoun({
    required this.forms,
  });
}

class PANCombo {
  String sentenceStarter;
  String sentenceEnder;

  Noun? noun;
  late List<String> correctNouns;
  late String initialNounDropDownValue;

  Adjective? possPronoun;
  late List<String> correctPossPronouns;
  late String initialPossPronDropDownValue;

  Adjective? adjective;
  late List<String> correctAdjectives;
  late String initialAdjDropDownValue;

  PersonalPronoun? personalPronoun;
  late List<String> correctPersonalPronouns;
  late String initialPersonalPronDropDownValue;

  bool usePersonalPronounShortForm;
  Cases caseType;
  Genders gender;
  bool isPlural;

  PANCombo({
    required this.sentenceStarter,
    this.sentenceEnder = '',
    this.noun,
    this.possPronoun,
    this.adjective,
    this.personalPronoun,
    required this.caseType,
    required this.gender,
    required this.isPlural,
    this.usePersonalPronounShortForm = false,
  }) {
    this.correctNouns =
        this.noun == null ? [] : this.noun!.getDeclensions(isPlural, caseType);

    this.initialNounDropDownValue =
        this.noun == null ? '' : this.noun!.getDropDownInitial(caseType);

    this.correctAdjectives = this.adjective == null
        ? []
        : this
            .adjective!
            .getDeclensions(gender, isPlural, caseType, noun!.isAnimate);

    this.initialAdjDropDownValue = this.adjective == null
        ? ''
        : this.adjective!.getDropDownInitial(caseType);

    this.correctPossPronouns = this.possPronoun == null
        ? []
        : this
            .possPronoun!
            .getDeclensions(gender, isPlural, caseType, noun!.isAnimate);

    this.initialPossPronDropDownValue = this.possPronoun == null
        ? ''
        : this.possPronoun!.getDropDownInitial(caseType);

    this.correctPersonalPronouns = this.personalPronoun == null
        ? []
        : this.personalPronoun!.getDeclensions(caseType);
    this.initialPersonalPronDropDownValue = this.personalPronoun == null
        ? ''
        : this.personalPronoun!.getDropDownInitial(caseType);
  }
}

class StaticSentenceParts {
  final String start;
  final String end;

  StaticSentenceParts({this.start = '', this.end = ''});
}

class SentenceBank {
  final  nouns;
  final List<Adjective> adjectives;
  final List<Adjective> possessivePronouns;
  final List<PersonalPronoun> personalPronouns;

  SentenceBank(
      {required this.nouns,
      required this.adjectives,
      required this.possessivePronouns,
      required this.personalPronouns});

  SentenceBank excludeNounsByTags(List<Tags> tagsToFilter) {
    var result = SentenceBank(
      nouns: [
        ...this.nouns.where((n) => !listsShareElements(tagsToFilter, n.tags))
      ],
      adjectives: [...this.adjectives],
      possessivePronouns: [...this.possessivePronouns],
      personalPronouns: [...this.personalPronouns],
    );

    return result;
  }

  SentenceBank excludePronoun(String toFilter) {
    var result = SentenceBank(
      nouns: [...this.nouns],
      adjectives: [...this.adjectives],
      possessivePronouns: [...this.possessivePronouns],
      personalPronouns: [...this.personalPronouns],
    );

    final svoj = result.possessivePronouns
        .firstWhere((e) => e.nominativ!.masculine.singular.first == toFilter);
    result.possessivePronouns.remove(svoj);

    return result;
  }

  SentenceBank filterNounsGender(Genders gender) {
    var result = SentenceBank(
      nouns: [...this.nouns.where((n) => n.gender == gender)],
      adjectives: [...this.adjectives],
      possessivePronouns: [...this.possessivePronouns],
      personalPronouns: [...this.personalPronouns],
    );

    return result;
  }

  SentenceBank includeOnlyNounsByTags(List<Tags> tagsToFilter) {
    var result = SentenceBank(
      nouns: [
        ...this.nouns.where((n) => listsShareElements(tagsToFilter, n.tags))
      ],
      adjectives: [],
      possessivePronouns: [],
      personalPronouns: [],
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
