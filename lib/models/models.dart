import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:nrs_flutter_lib/enums.dart';

import 'enums.dart';

class CaseSentencePart {
  final bool isCorrectable;
  String displayValue;
  GrammarTypes grammarType;
  List<String> correctValues;
  dynamic actualObject;

  CaseSentencePart({
    required this.displayValue,
    this.grammarType = GrammarTypes.noun,
    this.correctValues = const [],
    this.isCorrectable = false,
    this.actualObject,
  }) {
    assert(this.actualObject is Adjective ||
        this.actualObject is PersonalPronoun ||
        this.actualObject is Noun ||
        this.actualObject == null);
  }
}

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
    required this.singular,
    required this.plural,
  });
}

class DeclensionPronoun {
  final List<String> forms;

  DeclensionPronoun({
    required this.forms,
  });
}

class PANCombo {
  String translation;
  String extraInfo;
  final List<CaseSentencePart> sentenceParts;
  final Cases caseType;
  final Genders gender;
  final bool isPlural;
  final bool isAnimate;

  PANCombo({
    this.translation = '',
    this.extraInfo = '',
    required this.caseType,
    required this.gender,
    required this.isPlural,
    required this.sentenceParts,
    required this.isAnimate,
  });
}

class SentenceBank {
  final nouns;
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

class StaticSentenceParts {
  final String start;
  final String end;

  StaticSentenceParts({this.start = '', this.end = ''});
}
