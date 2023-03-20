class PanGenerator {
  // static Adjective? getAdjectiveItem(List<Adjective> source, Noun noun) {
  //   if (source.length == 0) return null;

  //   final item = source[Nrs.getRandomNumber(max: source.length)];

  //   if (item.isCompatible(noun.tags)) {
  //     return item;
  //   }

  //   return null;
  // }

  // static PANCombo getPANCombos(
  //     {required Cases caseType,
  //     required SentenceBank bank,
  //     required DialectType dialect,
  //     required StaticSentenceParts Function(
  //             Noun, bool, Adjective?, Adjective?, DialectType)
  //         getStaticSentenceParts,
  //     required StaticSentenceParts Function(PersonalPronoun, bool, DialectType)
  //         getPersonalPronounSentenceStaticParts}) {
  //   if (caseType == Cases.Vok) {
  //     final noun = bank.nouns[Nrs.getRandomNumber(max: bank.nouns.length)];
  //     final staticParts =
  //         getStaticSentenceParts(noun, false, null, null, dialect);

  //     return PANCombo(
  //         caseType: caseType,
  //         gender: noun.gender,
  //         isPlural: false,
  //         sentenceParts: []);
  //   }

  //   final maxRandom = bank.personalPronouns.length == 0 ? 2 : 3;
  //   var exType = Nrs.getRandomNumber(max: maxRandom);

  //   if (exType == 0) {
  //     final noun = bank.nouns[Nrs.getRandomNumber(max: bank.nouns.length)];
  //     final isPlural = noun.nominativ.plural.first != '' && Nrs.coinFlip();
  //     final possPronoun = getAdjectiveItem(bank.possessivePronouns, noun);
  //     final adj = getAdjectiveItem(bank.adjectives, noun);

  //     final staticParts =
  //         getStaticSentenceParts(noun, isPlural, possPronoun, adj, dialect);

  //     return PANCombo(
  //         caseType: caseType,
  //         gender: noun.gender,
  //         isPlural: isPlural,
  //         sentenceParts: []);
  //   } else if (exType == 1) {
  //     final noun = bank.nouns[Nrs.getRandomNumber(max: bank.nouns.length)];
  //     final isPlural = noun.nominativ.plural.first != '' && Nrs.coinFlip();
  //     final staticParts =
  //         getStaticSentenceParts(noun, isPlural, null, null, dialect);

  //     return PANCombo(
  //         caseType: caseType,
  //         gender: noun.gender,
  //         isPlural: isPlural,
  //         sentenceParts: []);
  //   } else {
  //     final persPronoun = bank.personalPronouns[
  //         Nrs.getRandomNumber(max: bank.personalPronouns.length)];
  //     final isPlural = persPronoun.isPlural;
  //     final staticParts =
  //         getPersonalPronounSentenceStaticParts(persPronoun, isPlural, dialect);

  //     return PANCombo(
  //       caseType: caseType,
  //       gender: persPronoun.gender,
  //       isPlural: isPlural,
  //       sentenceParts: [],
  //     );
  //   }
  //}
}
