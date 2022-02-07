import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/utilities/navika-helpers.dart';

class LokativGenerators {
  static StaticSentenceParts getStaticSentenceParts(
    Noun noun,
    bool isPlural,
    Adjective? pronoun,
    Adjective? adjective,
  ) {
    final pronounVal = pronoun == null ? '' : pronoun.dictionary;
    String start = '';
    String end = '';

    if (noun.tags.contains(Tags.Season)) {
      if (pronounVal != 'moj') {
        start = '';
        end = 'radim kao turistički vodič';
      } else {
        end = 'puno radite?';
      }
    } else if (noun.tags.contains(Tags.FlatSurface)) {
      start = N.coinFlip() ? 'Spavam u' : 'Jabuka je na';
    } else if (noun.tags.contains(Tags.WorkPlace)) {
      start = pronounVal == 'moj' ? 'On rade u' : 'Radim u';
    } else if (noun.tags.contains(Tags.Location)) {
      start = pronounVal == 'moj' ? 'On živi u' : 'Živim u';
    } else {
      start = 'Razgovaramo o';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
      PersonalPronoun personalPronoun, bool isShortForm) {
    final actualValue = personalPronoun.nominativ.forms.first;
    String start = '';
    String end = '';

    if (N.coinFlip()) {
      start = actualValue != 'ja' ? 'Sanjam o' : 'On je kod';
    } else {
      start = 'Razgovaramo o';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static CaseQuestionState createExercise(List toAvoid) {
    PANCombo? c;

    while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
      c = N.getPANCombos(
        caseType: Cases.Lok,
        bank: wordBank,
        getPersonalPronounSentenceStaticParts:
            getPersonalPronounSentenceStaticParts,
        getStaticSentenceParts: getStaticSentenceParts,
      );
    }

    return CaseQuestionState(combos: c);
  }
}
