import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'enums.dart';

class SettingsSet {
  late EntryTypes entryType;
  late bool possessivePronounsIncluded;
  late bool personalPronounsIncluded;
  late bool adjectivesIncluded;
  late bool nounsIncluded;

  SettingsSet({
    required this.entryType,
    required this.possessivePronounsIncluded,
    required this.personalPronounsIncluded,
    required this.adjectivesIncluded,
    required this.nounsIncluded,
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
    var result = [...this.singular, ...this.plural];
    result.removeWhere((element) => element == '');
    return result;
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

class QuestionStateItem {
  PANCombo combos;
  late bool isCorrect = false;
  late String userNounResponse;
  late String userPossPronResponse;
  late String userAdjResponse;
  late String userPersPronResponse;

  QuestionStateItem({required this.combos}) {
    userNounResponse = '';
    userPossPronResponse = '';
    userAdjResponse = '';
    userPersPronResponse = '';
  }

  bool checkAnswers() {
    final pos =
        getIsCorrect(this.combos.correctPossPronouns, userPossPronResponse);
    final adj = getIsCorrect(this.combos.correctAdjs, userAdjResponse);
    final noun = getIsCorrect(this.combos.correctNouns, userNounResponse);
    final persPron =
        getIsCorrect(this.combos.correctPersPronouns, userPersPronResponse);

    return pos && adj && noun && persPron;
  }

  bool getIsCorrect(List<String> acceptedAnswers, String? actualAnswer) {
    if (acceptedAnswers.length == 0 ||
        (acceptedAnswers.length == 0 && actualAnswer == '')) {
      return true;
    }

    return acceptedAnswers.contains(actualAnswer);
  }
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
  late List<String> correctAdjs;
  late String initialAdjDropDownValue;

  PersonalPronoun? personalPronoun;
  late List<String> correctPersPronouns;
  late String initialPersPronDropDownValue;

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
        this.noun == null ? [] : this.noun!.getDeclensionsForCaseType(caseType);

    this.initialNounDropDownValue =
        this.noun == null ? '' : this.noun!.getDropDownInitial(caseType);

    this.correctAdjs = this.adjective == null
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

    this.correctPersPronouns = this.personalPronoun == null
        ? []
        : this.personalPronoun!.getDeclensions(caseType);
    this.initialPersPronDropDownValue = this.personalPronoun == null
        ? ''
        : this.personalPronoun!.getDropDownInitial(caseType);
  }
}

class StaticSentenceParts {
  final String start;
  final String end;

  StaticSentenceParts({this.start = '', this.end = ''});
}
