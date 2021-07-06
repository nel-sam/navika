import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';

class GenetivGenerators {
  static StaticSentenceParts getStaticSentenceParts(
      Noun noun, bool isPlural, Adjective? pronoun, Adjective? adjective) {
    String start = '';
    String end = '';

    if (noun.tags.contains(Tags.BodyPart) && !isPlural) {
      start = 'Boja';
      end = 'je lijepa';
    } else if (noun.tags.contains(Tags.Human) ||
        noun.tags.contains(Tags.Portable)) {
      if (pronoun!.dictionary != 'moj')
        start = N.coinFlip() ? 'Otkad sam bez' : 'Ići ću bez';
      else
        start = 'Ići ćeš bez';
    } else if (noun.tags.contains(Tags.Country)) {
      start = pronoun!.dictionary != 'moj' ? 'Ja sam iz' : 'On je iz';
    } else if (noun.tags.contains(Tags.Location)) {
      start =
          pronoun!.dictionary != 'mi' ? 'Idemo od kuće do' : 'Idem od kuće do';
    } else if (noun.tags.contains(Tags.Health)) {
      if (pronoun!.dictionary == 'ja')
        start = 'Ne mogu raditi zbog';
      else {
        start = 'Život bez';
        end = 'je naibolji';
      }
    } else if (noun.tags.contains(Tags.Emotion)) {
      start = 'Prije';
      end = 'treba se smiriti';
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

    if (actualValue != 'on') {
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

  static List<PANExerciseItem> getPANCombos(SettingsSet settingsSet) {
    final WordBank bank = wordBank;

    return N.getPANCombos(
      bank.filter(settingsSet),
      getStaticSentenceParts,
      getPersonalPronounSentenceStaticParts,
    );
  }
}
