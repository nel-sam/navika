import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative-pronouns.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class GenitivExercises {
  late bool isCroatian;
  final Cases caseType = Cases.Gen;

  GenitivExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
  }

  List<PANCombo> get general => [
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.krevet.gender,
            isPlural: false,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Koja je vrsta'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.krevet,
                displayValue: '',
                correctValues: NounBankGeneral.krevet.genitiv.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'prava za vas?'),
            ],
            isAnimate: false,
            translation: N.t('ex_Koja_je_vrsta_kreveta_prava_za_vas')),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          sentenceParts: [
            CaseSentencePart(displayValue: "Mogu li dobiti malo"),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: DemonstrativePronouns.taj,
              displayValue: '',
              correctValues:
                  DemonstrativePronouns.taj.genitiv!.feminine!.singular,
              grammarType: GrammarTypes.demonstrativePronoun,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.sladak,
              displayValue: '',
              correctValues:
                  AdjectiveBankGeneral.sladak.genitiv!.feminine!.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.torta,
              displayValue: '',
              correctValues: NounBankGeneral.torta.genitiv.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: "?"),
          ],
          isAnimate: false,
          translation: N.t('ex_Mogu_li_dobiti_malo_te_slatke_torte'),
        ),
      ];

  List<PANCombo> get personalPronouns => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Stani_iza_mene'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Stani iza'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              displayValue: PersonalPronounWordBank.ja.dictionary,
              correctValues: PersonalPronounWordBank.ja.genitiv.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: '!'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_S_tobom_ili_bez_tebe'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'S tobom ili bez'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ti,
              displayValue: PersonalPronounWordBank.ti.dictionary,
              correctValues: PersonalPronounWordBank.ti.genitiv.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Zbog_njega_sam_nosio_masku'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Zbog'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.on,
              displayValue: PersonalPronounWordBank.on.dictionary,
              correctValues: PersonalPronounWordBank.on.genitiv.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'sam nosio masku'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Kako_cu_zivjeti_bez_nje'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Kako ću živjeti bez'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ona,
              displayValue: PersonalPronounWordBank.ona.dictionary,
              correctValues: PersonalPronounWordBank.ona.genitiv.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: '?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Svatko_od_nas_ima_nesto_dobro'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Svatko od'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.mi,
              displayValue: PersonalPronounWordBank.mi.dictionary,
              correctValues: PersonalPronounWordBank.mi.genitiv.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'ima nešto dobro'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_To_moze_biti_na_putu_do_vas'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'To može biti na putu do'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.vi,
              displayValue: PersonalPronounWordBank.vi.dictionary,
              correctValues: PersonalPronounWordBank.vi.genitiv.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Kod_njih_je_sve_obrnuto'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Kod'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.oni,
              displayValue: PersonalPronounWordBank.oni.dictionary,
              correctValues: PersonalPronounWordBank.oni.genitiv.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'je sve obrnuto'),
          ],
        ),
      ];

  List<PANCombo> get premium => [];
}
