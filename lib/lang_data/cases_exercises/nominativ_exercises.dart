import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative-pronouns.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class NominativExercises {
  late bool isSerbian;
  final Cases caseType = Cases.Nom;

  NominativExercises(DialectType dialect) {
    this.isSerbian = dialect == DialectType.Ekavian;
  }

  List<PANCombo> get level1 => [
        PANCombo(
            caseType: caseType,
            gender: Genders.Masculine,
            isPlural: false,
            isAnimate: false,
            getTrans: () => N.t('ex_taj_stari_avion_ima_dva_krila'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: DemonstrativePronouns.taj,
                displayValue: '',
                correctValues:
                    DemonstrativePronouns.taj.nominativ!.masculine.singular,
                grammarType: GrammarTypes.demonstrativePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: AdjectiveBankGeneral.star,
                displayValue: '',
                correctValues: AdjectiveBankGeneral.star
                    .getDeclensions(Genders.Masculine, false, Cases.Nom, false),
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject:
                    isSerbian ? NounsEkavian.avion : NounsIjekavian.zrakoplov,
                displayValue: '',
                correctValues: isSerbian
                    ? NounsEkavian.avion.getDeclensions(false, Cases.Nom)
                    : NounsIjekavian.zrakoplov.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'ima dva krila'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: Genders.Feminine,
            isPlural: false,
            isAnimate: false,
            getTrans: () => N.t('ex_francuska_ima_oko_61_milijun_stanovnika'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.francuska,
                displayValue: '',
                correctValues:
                    NounBankGeneral.francuska.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'ima oko 61 milijun stanovnika'),
            ]),
      ];

  List<PANCombo> get level2 => [];

  List<PANCombo> get personalPronouns => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          isAnimate: true,
          sentenceParts: [
            CaseSentencePart(displayValue: 'Reci'),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.ja.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.ja.nominativ.forms,
            ),
            CaseSentencePart(displayValue: 'sve o tome'),
          ],
        ),
      ];

  List<PANCombo> get premium => [];
}
