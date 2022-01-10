import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/state/cases/case-question-state-item.dart';
import 'package:navika/utilities/navika-helpers.dart';

class GenetivGenerators {
  static StaticSentenceParts getStaticSentenceParts(
      Noun noun, bool isPlural, Adjective? pronoun, Adjective? adjective) {
    String start = '';
    String end = '';
    String pronounStr = pronoun == null ? '' : pronoun.dictionary;

    if (noun.tags.contains(Tags.Health)) {
      if (pronounStr == 'ja')
        start = 'Ne mogu raditi zbog';
      else {
        start = 'Život bez';
        end = 'je naibolji';
      }
    } else if (noun.tags.contains(Tags.Emotion)) {
      start = 'Prije';
      end = 'treba se smiriti';
    } else if (noun.tags.contains(Tags.Country)) {
      start = pronounStr != 'moj' ? 'Ja sam iz' : 'On je iz';
    } else if (noun.tags.contains(Tags.Location)) {
      start = pronounStr != 'mi' ? 'Idemo od kuće do' : 'Idem od kuće do';
    } else if (noun.tags.contains(Tags.Season)) {
      if (N.coinFlip())
        start = N.coinFlip() ? 'Prije' : 'Preko';
      else
        start = 'U svemiru nema';
    } else if (noun.tags.contains(Tags.Portable)) {
      start = N.coinFlip() ? 'Pas je sada ispred' : 'Čekaj iza';
      end = '';
    } else if (noun.tags.contains(Tags.WorkPlace)) {
      start = N.coinFlip() ? 'Sad čekamo iza' : 'Bio je iza';
    } else if (noun.tags.contains(Tags.FlatSurface)) {
      start = 'Vrh';
      end = 'je prljav';
    } else if (noun.tags.contains(Tags.BodyPart) && !isPlural) {
      start = 'Boja';
      end = 'je lijepa';
    } else if (noun.tags.contains(Tags.Human) && N.coinFlip()) {
      start = 'Ja sam kod';
    } else if (noun.tags.contains(Tags.Human) ||
        noun.tags.contains(Tags.Portable)) {
      if (pronounStr != 'moj') if (N.coinFlip())
        start = N.coinFlip() ? 'Otkad sam bez' : 'Ići ću bez';
      else
        start = 'Kraj';
      else
        start = N.coinFlip() ? 'Kraj' : 'Ići ćeš bez';
    } else if (pronoun == null) {
      start = 'Vidim puno';
    } else if (N.coinFlip()) {
      start = 'Volim boja';
    } else {
      start = 'Nema';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static StaticSentenceParts getPersonalPronounSentenceStaticParts(
      PersonalPronoun personalPronoun, bool isShortForm) {
    String start = '';
    String end = '';
    final actualValue = personalPronoun.nominativ.forms.first;

    if (N.coinFlip() && N.coinFlip())
      start = 'Kraj';
    else if (actualValue != 'on') {
      start = N.coinFlip() ? 'Nisam spavala zbog' : 'On pleše';
    } else if (actualValue != 'oni') {
      start = N.coinFlip() ? 'Oni su išli bez' : 'Ne možeš spavati zbog';
    } else if (actualValue != 'ja') {
      start = N.coinFlip() ? 'Ne mogu spavati zbog' : 'Stojim iza';
    } else {
      start = 'Stanite iza';
      end = ', molim vas';
    }

    return StaticSentenceParts(start: start, end: end);
  }

  static List<CaseQuestionStateItem> initializePANStateItems() {
    final combos = N.getPANCombos(
      caseType: Cases.Gen,
      bank: wordBank,
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      getStaticSentenceParts: getStaticSentenceParts,
    );

    combos.shuffle();

    final result = combos.take(BATCH_COUNT).map((c) {
      return CaseQuestionStateItem(combos: c);
    });

    return result.toList();
  }
}
