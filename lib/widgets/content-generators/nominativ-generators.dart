import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';

class NominativGenerators {
  static StaticSentenceParts getStaticSentenceParts(
      Noun noun, bool isPlural, Adjective? pronoun, Adjective? adjective) {
    final tense = N.getRandomTense();
    String start = '';
    String end = '';

    if (noun.isAnimate && isPlural) {
      if (tense == TenseEnum.Past || tense == TenseEnum.Conditional) {
        start = noun.gender == Genders.Feminine ? 'One su bile' : 'Oni su bili';
      } else {
        start = noun.gender == Genders.Feminine ? 'One su' : 'Oni su';
      }
    } else if (!noun.isAnimate && isPlural) {
      if (tense == TenseEnum.Future || tense == TenseEnum.Conditional)
        start = isPlural ? 'One će biti' : 'To će biti';
      else {
        start = 'To su';
      }
    } else if (noun.isAnimate && !isPlural) {
      if (tense == TenseEnum.Past || tense == TenseEnum.Conditional) {
        start = noun.gender == Genders.Feminine ? 'Ona će biti' : 'On će biti';
      } else {
        start = noun.gender == Genders.Feminine ? 'Ona je' : 'On su';
      }
    } else if (!noun.isAnimate && !isPlural) {
      if (tense == TenseEnum.Past || tense == TenseEnum.Conditional) {
        if (noun.gender == Genders.Feminine) {
          start = 'To je bila';
        } else if (noun.gender == Genders.Masculine)
          start = 'To je bio';
        else
          start = 'To je bilo';
      }
    }

    if (start == '' && end == '') {
      start = 'To je';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
      PersonalPronoun personalPronoun, bool isShortForm) {
    String start = '';
    String end = '';
    final verb = N.getBitiConjugation(personalPronoun.nominativ.forms.first);

    if (N.coinFlip()) {
      start = 'To ' + verb;
    } else {
      var ocupation = personalPronoun.gender == Genders.Feminine
          ? (personalPronoun.isPlural ? 'učiteljice' : 'učiteljica')
          : (personalPronoun.isPlural ? 'učitelji' : 'učitelj');
      end = '$verb $ocupation';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static List<QuestionStateItem> initializePANStateItems() {
    final combos = N.getPANCombos(
      caseType: Cases.Nom,
      bank: wordBank.excludePronoun('svoj'),
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      getStaticSentenceParts: getStaticSentenceParts,
    );

    final result = combos.map((c) {
      return QuestionStateItem(combos: c);
    });

    return result.toList();
  }
}
