import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state-item.dart';
import 'package:navika/utilities/navika-helpers.dart';

class VokativGenerators {
  static StaticSentenceParts getStaticSentenceParts(
      Noun noun, bool isPlural, Adjective? pronoun, Adjective? adjective) {
    return StaticSentenceParts(start: 'Zdravo, ', end: '!');
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
      PersonalPronoun personalPronoun, bool isShortForm) {
    return StaticSentenceParts(start: 'Zdravo, ', end: '!');
  }

  static List<CaseQuestionStateItem> initializePANStateItems() {
    final combos = N.getPANCombos(
      caseType: Cases.Vok,
      bank: wordBank.includeOnlyNounsByTags([Tags.Human]),
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      getStaticSentenceParts: getStaticSentenceParts,
    );

    final result = combos.map((c) {
      return CaseQuestionStateItem(combos: c);
    });

    return result.toList();
  }
}
