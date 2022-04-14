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

class VokativGenerators {
  static CaseQuestionState createExercise(
    List toAvoid,
    ExerciseTypes exerciseType,
    DialectType dialect,
  ) {
    PANCombo? c;

    while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
      c = PanGenerator.getPANCombos(
        caseType: Cases.Vok,
        dialect: dialect,
        bank: SentenceBankGenerator(dialect: dialect)
            .sentences
            .includeOnlyNounsByTags([Tags.Human]),
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
    DialectType dialect,
  ) {
    var start = Nrs.coinFlip() ? 'Zdravo, ' : 'Hej, ';
    return StaticSentenceParts(start: start, end: '');
  }

  static StaticSentenceParts getStaticSentenceParts(
    Noun noun,
    bool isPlural,
    Adjective? pronoun,
    Adjective? adjective,
    DialectType dialect,
  ) {
    var start = Nrs.coinFlip() ? 'Zdravo, ' : 'Hej, ';
    return StaticSentenceParts(start: start, end: '');
  }
}
