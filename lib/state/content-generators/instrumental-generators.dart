import 'package:flutter/material.dart';
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

class InstrumentalGenerators {
  static CaseQuestionState createExercise(
      List toAvoid, ExerciseTypes exerciseType, DialectType dialect) {
    final SentenceBank bank =
        SentenceBankGenerator(dialect: dialect).sentencesBankData.excludeNounsByTags([
      Tags.Location,
      Tags.Health,
    ]);

    PANCombo? c;

    // while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
    //   c = PanGenerator.getPANCombos(
    //     caseType: Cases.Ins,
    //     bank: bank,
    //     dialect: dialect,
    //     getPersonalPronounSentenceStaticParts:
    //         getPersonalPronounSentenceStaticParts,
    //     getStaticSentenceParts: getStaticSentenceParts,
    //   );
    // }

    return CaseQuestionState(combos: c!);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun,
    bool isShortForm,
    DialectType dialect,
  ) {
    final actualValue = personalPronoun.nominativ.forms.first;
    String start = '';
    String end = '';

    if (actualValue != 'ja') {
      start = 'Ja ću pjevati s';
    } else {
      start = 'On će ići s';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static String getsSa(Noun noun, Adjective? pronoun, Adjective? adjective) {
    const saLetters = 'sšzž';

    if (pronoun != null &&
        saLetters.contains(pronoun.dictionary.characters.first)) {
      return 'sa';
    } else if (pronoun != null) {
      return 's';
    } else if (adjective != null && saLetters.contains(adjective.dictionary)) {
      return 'sa';
    } else if (adjective != null) {
      return 's';
    } else if (saLetters.contains(noun.dictionary.characters.first)) {
      return 'sa';
    }

    return 's';
  }

  static StaticSentenceParts getStaticSentenceParts(
    Noun noun,
    bool isPlural,
    Adjective? pronoun,
    Adjective? adjective,
    DialectType dialect,
  ) {
    String start = '';
    String end = '';
    String possPronouns =
        pronoun == null ? '' : pronoun.nominativ!.masculine.singular.first;
    String sSa = getsSa(
      noun,
      pronoun,
      adjective,
    );

    if (noun.tags.contains(Tags.Season)) {
      start = 'Povezana je $sSa';
    } else if (noun.tags.contains(Tags.FlatSurface)) {
      start = Nrs.coinFlip() ? 'Pas je nad' : 'Majka je pred';
    } else if (noun.tags.contains(Tags.BodyPart)) {
      start =
          possPronouns == 'moj' ? 'Ovo ti dobro ide s' : 'Ovo mi dobro ide s';
    } else if (noun.tags.contains(Tags.Vehicle)) {
      start = possPronouns == 'moj' ? 'Putujemo' : 'Putujem';
    } else if (noun.tags.contains(Tags.Human) ||
        noun.tags.contains(Tags.Portable)) {
      if (possPronouns != 'tvoj')
        start = Nrs.coinFlip() ? 'Ti ideš $sSa' : 'Treba ti da ideš $sSa';
      else
        start = Nrs.coinFlip() ? 'Otići ću za' : 'Idemo $sSa';
    } else if (noun.tags.contains(Tags.Health)) {
      start = possPronouns == 'moj' ? 'Putovao je $sSa' : 'Putovao sam $sSa';
    } else if (noun.tags.contains(Tags.Location)) {
      start = '';
    } else if (possPronouns == 'moj')
      start = 'Ideš $sSa';
    else
      start = 'Idem $sSa';

    return StaticSentenceParts(start: start, end: end);
  }
}
