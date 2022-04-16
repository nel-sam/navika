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

class GenitivGenerators {
  static CaseQuestionState createExercise(
    List toAvoid,
    ExerciseTypes exerciseType,
    DialectType dialect,
  ) {
    PANCombo? c;

    while (c == null || N.containsCaseQuestionState(toAvoid, c)) {
      c = PanGenerator.getPANCombos(
        caseType: Cases.Gen,
        dialect: dialect,
        bank: SentenceBankGenerator(dialect: dialect).sentencesBankData,
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
    String start = '';
    String end = '';
    final actualValue = personalPronoun.nominativ.forms.first;

    if (Nrs.coinFlip() && Nrs.coinFlip())
      start = 'Kraj';
    else if (actualValue != 'on') {
      start = Nrs.coinFlip() ? 'Nisam spavala zbog' : 'On pleše';
    } else if (actualValue != 'oni') {
      start = Nrs.coinFlip() ? 'Oni su išli bez' : 'Ne možeš spavati zbog';
    } else if (actualValue != 'ja') {
      start = Nrs.coinFlip() ? 'Ne mogu spavati zbog' : 'Stojim iza';
    } else {
      start = 'Stanite iza';
      end = ', molim vas';
    }

    return StaticSentenceParts(start: start, end: end);
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
    String pronounStr = pronoun == null ? '' : pronoun.dictionary;
    final isSerbian = dialect == DialectType.Ekavian;

    if (noun.tags.contains(Tags.Health)) {
      if (pronounStr == 'ja')
        start = 'Ne mogu raditi zbog';
      else {
        start = 'Život bez';
        end = 'je najbolji';
      }
    } else if (noun.tags.contains(Tags.Emotion)) {
      start = isSerbian ? 'Pre' : 'Prije';
      end = 'treba se smiriti';
    } else if (noun.tags.contains(Tags.Country)) {
      start = pronounStr != 'moj' ? 'Ja sam iz' : 'On je iz';
    } else if (noun.tags.contains(Tags.Location)) {
      start = pronounStr != 'mi' ? 'Idemo od kuće do' : 'Idem od kuće do';
    } else if (noun.tags.contains(Tags.Season)) {
      if (Nrs.coinFlip())
        start = Nrs.coinFlip() ? 'Prije' : 'Preko';
      else
        start = 'U svemiru nema';
    } else if (noun.tags.contains(Tags.Portable)) {
      start = Nrs.coinFlip() ? 'Pas je sada ispred' : 'Čekaj iza';
      end = '';
    } else if (noun.tags.contains(Tags.WorkPlace)) {
      start = Nrs.coinFlip() ? 'Sad čekamo iza' : 'Bio je iza';
    } else if (noun.tags.contains(Tags.FlatSurface)) {
      start = 'Vrh';
      end = 'je prljav';
    } else if (noun.tags.contains(Tags.BodyPart) && !isPlural) {
      start = 'Boja';
      end = 'je tamna';
    } else if (noun.tags.contains(Tags.Human) && Nrs.coinFlip()) {
      start = 'Ja sam kod';
    } else if (noun.tags.contains(Tags.Human) ||
        noun.tags.contains(Tags.Portable)) {
      if (pronounStr != 'moj') if (Nrs.coinFlip())
        start = Nrs.coinFlip() ? 'Otkad sam bez' : 'Ići ću bez';
      else
        start = 'Kraj';
      else
        start = Nrs.coinFlip() ? 'Kraj' : 'Ići ćeš bez';
    } else if (pronoun == null) {
      start = 'Vidim puno';
    } else if (Nrs.coinFlip()) {
      start = 'Volim boja';
    } else {
      start = 'Nema';
    }

    return StaticSentenceParts(start: start, end: end);
  }
}
