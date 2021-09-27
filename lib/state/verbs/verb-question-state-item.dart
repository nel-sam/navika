import 'package:navika/models/enums.dart';
import 'package:navika/models/verb.dart';

class VerbQuestionStateItem {
  Verb verb;
  VerbTenses tense;
  ConjPronounTypes conjPronounTypes;
  Genders gender;
  bool isPlural;
  late bool isCorrect;

  VerbQuestionStateItem({
    required this.tense,
    required this.verb,
    required this.gender,
    required this.isPlural,
    required this.conjPronounTypes,
    this.isCorrect = false,
  });
}
