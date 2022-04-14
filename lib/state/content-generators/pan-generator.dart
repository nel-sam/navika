import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class PanGenerator {
  static Adjective? getAdjectiveItem(List<Adjective> source, Noun noun) {
    if (source.length == 0) return null;

    final item = source[Nrs.getRandomNumber(max: source.length)];

    if (item.isCompatible(noun.tags)) {
      return item;
    }

    return null;
  }

  static PANCombo getPANCombos(
      {required Cases caseType,
      required SentenceBank bank,
      required StaticSentenceParts Function(Noun, bool, Adjective?, Adjective?)
          getStaticSentenceParts,
      required StaticSentenceParts Function(PersonalPronoun, bool)
          getPersonalPronounSentenceStaticParts}) {
    if (caseType == Cases.Vok) {
      final noun = bank.nouns[Nrs.getRandomNumber(max: bank.nouns.length)];
      final staticParts = getStaticSentenceParts(noun, false, null, null);

      return PANCombo(
          caseType: caseType,
          sentenceStarter: staticParts.start,
          sentenceEnder: staticParts.end,
          possPronoun: null,
          adjective: null,
          gender: noun.gender,
          isPlural: false,
          noun: noun);
    }

    final maxRandom = bank.personalPronouns.length == 0 ? 2 : 3;
    var exType = Nrs.getRandomNumber(max: maxRandom);

    if (exType == 0) {
      final noun = bank.nouns[Nrs.getRandomNumber(max: bank.nouns.length)];
      final isPlural = noun.nominativ.plural.first != '' && Nrs.coinFlip();
      final possPronoun = getAdjectiveItem(bank.possessivePronouns, noun);
      final adj = getAdjectiveItem(bank.adjectives, noun);

      final staticParts =
          getStaticSentenceParts(noun, isPlural, possPronoun, adj);

      return PANCombo(
          caseType: caseType,
          sentenceStarter: staticParts.start,
          sentenceEnder: staticParts.end,
          possPronoun: possPronoun,
          adjective: adj,
          gender: noun.gender,
          isPlural: isPlural,
          noun: noun);
    } else if (exType == 1) {
      final noun = bank.nouns[Nrs.getRandomNumber(max: bank.nouns.length)];
      final isPlural = noun.nominativ.plural.first != '' && Nrs.coinFlip();
      final staticParts = getStaticSentenceParts(noun, isPlural, null, null);

      return PANCombo(
          caseType: caseType,
          sentenceStarter: staticParts.start,
          sentenceEnder: staticParts.end,
          possPronoun: null,
          adjective: null,
          gender: noun.gender,
          isPlural: isPlural,
          noun: noun);
    } else {
      final persPronoun = bank.personalPronouns[
          Nrs.getRandomNumber(max: bank.personalPronouns.length)];
      final isPlural = persPronoun.isPlural;
      final staticParts =
          getPersonalPronounSentenceStaticParts(persPronoun, isPlural);

      return PANCombo(
        caseType: caseType,
        sentenceStarter: staticParts.start,
        sentenceEnder: staticParts.end,
        gender: persPronoun.gender,
        isPlural: isPlural,
        personalPronoun: persPronoun,
        usePersonalPronounShortForm: Nrs.coinFlip(),
      );
    }
  }
}
