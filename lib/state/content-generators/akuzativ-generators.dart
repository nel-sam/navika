import 'package:navika/lang_data/sentence_bank_generator.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state.dart';
import 'package:navika/state/content-generators/pan-generator.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class AkuzativGenerators {
  static CaseQuestionState createExercise(
    List toAvoid,
    ExerciseTypes exerciseType,
    DialectType dialect,
  ) {
    PANCombo? c;

    while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
      c = PanGenerator.getPANCombos(
        caseType: Cases.Aku,
        bank: SentenceBankGenerator(dialect: dialect).sentences,
        getPersonalPronounSentenceStaticParts:
            getPersonalPronounSentenceStaticParts,
        getStaticSentenceParts: getStaticSentenceParts,
      );
    }

    return CaseQuestionState(combos: c);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun,
    bool isShortForm,
  ) {
    final actualValue = personalPronoun.nominativ.forms.first;
    String start = '';
    String end = '';

    if (actualValue != 'mi' && Nrs.coinFlip()) {
      start = 'Vidimo';
    } else if (actualValue != 'ti' && Nrs.coinFlip()) {
      start = 'Daj to ';
    } else if (isShortForm) {
      start = 'Molim';
    } else {
      start = actualValue != 'ti' ? 'Vidiš' : 'Vidim';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static StaticSentenceParts getStaticSentenceParts(
      Noun noun, bool isPlural, Adjective? pronoun, Adjective? adjective) {
    String start = '';
    String end = '';
    final pron = pronoun != null ? pronoun.nominativ!.masculine.singular : '';

    if (noun.tags.contains(Tags.Season)) {
      start = Nrs.coinFlip() ? 'Volim' : 'Ne volim';
    } else if (noun.tags.contains(Tags.Location)) {
      start = 'Idemo u';
    } else if (noun.tags.contains(Tags.Food)) {
      start = Nrs.coinFlip() ? 'Ću jesti' : 'Želi';
    } else if (pron != 'moj')
      start = Nrs.coinFlip() ? 'Ja vidim' : 'Volim';
    else if (noun.tags.contains(Tags.Portable)) {
      start = 'Daj joj';
    } else {
      start = 'Vidimo';
    }

    return StaticSentenceParts(start: start, end: end);
  }
}
