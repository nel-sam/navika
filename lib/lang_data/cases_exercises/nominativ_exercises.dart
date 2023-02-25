import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative-pronouns.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal-pronouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class NominativExercises {
  late bool isCroatian;
  final Cases caseType = Cases.Nom;

  NominativExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
  }

  List<PANCombo> get general => [
        PANCombo(
            caseType: caseType,
            gender: Genders.Feminine,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_Cija_je_kava'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: AdjectiveBankGeneral.ciji,
                displayValue: '',
                correctValues:
                    AdjectiveBankGeneral.ciji.nominativ!.feminine!.singular,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(displayValue: 'je'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject:
                    isCroatian ? NounsIjekavian.kava : NounsEkavian.kafa,
                displayValue: '',
                correctValues: isCroatian
                    ? NounsIjekavian.kava.getDeclensions(false, Cases.Nom)
                    : NounsEkavian.kafa.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: '?'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: Genders.Feminine,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_Koja_je_najbolja_sezona'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: DemonstrativePronouns.koji,
                displayValue: '',
                correctValues:
                    DemonstrativePronouns.koji.nominativ!.feminine!.singular,
                grammarType: GrammarTypes.demonstrativePronoun,
              ),
              CaseSentencePart(displayValue: 'je najbolja sezona?'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: Genders.Unspecific,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_Sto_je_to'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject:
                    isCroatian ? NounsIjekavian.sto : NounsEkavian.sta,
                displayValue: '',
                correctValues: isCroatian
                    ? NounsIjekavian.sto.getDeclensions(false, Cases.Nom)
                    : NounsEkavian.sta.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'je to?'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: Genders.Masculine,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_taj_stari_avion_ima_dva_krila'),
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
                    isCroatian ? NounsIjekavian.zrakoplov : NounsEkavian.avion,
                displayValue: '',
                correctValues: isCroatian
                    ? NounsIjekavian.zrakoplov.getDeclensions(false, Cases.Nom)
                    : NounsEkavian.avion.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'ima dva krila'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: Genders.Feminine,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_francuska_ima_oko_61_milijun_stanovnika'),
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
        PANCombo(
            caseType: caseType,
            gender: Genders.Feminine,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_Bosna_i_Srbija_imaju_planine'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.bosna,
                displayValue: '',
                correctValues:
                    NounBankGeneral.bosna.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'i'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.srbija,
                displayValue: '',
                correctValues:
                    NounBankGeneral.srbija.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'imaju planine'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: Genders.Neuter,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_Lice_je_prednji_dio_glave'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.lice,
                displayValue: '',
                correctValues:
                    NounBankGeneral.lice.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'je prednji dio glave'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: Genders.Feminine,
            isPlural: false,
            isAnimate: true,
            translation: N.t('ex_Njezina_majka_je_žena_koja_voli_putovati'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: PossessivePronounBank.njezin,
                displayValue: '',
                correctValues: PossessivePronounBank.njezin
                    .getDeclensions(Genders.Feminine, false, Cases.Nom, true),
                grammarType: GrammarTypes.possessivePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.majka,
                displayValue: '',
                correctValues:
                    NounBankGeneral.majka.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'je'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.zena,
                displayValue: '',
                correctValues:
                    NounBankGeneral.zena.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'koja voli putovati'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: Genders.Feminine,
            isPlural: false,
            isAnimate: true,
            translation: N.t('ex_Moja_sestra_boji_se_biti_sama'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: PossessivePronounBank.moj,
                displayValue: '',
                correctValues: PossessivePronounBank.moj
                    .getDeclensions(Genders.Feminine, false, Cases.Nom, true),
                grammarType: GrammarTypes.possessivePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.sestra,
                displayValue: '',
                correctValues:
                    NounBankGeneral.sestra.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'boji se biti sama'),
            ]),
      ];

  List<PANCombo> get personalPronouns => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Ja_volim_knjige'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.ja.nominativ.forms,
            ),
            CaseSentencePart(displayValue: 'volim knjige'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Ti_si_ljubazni'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ti,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.ti.nominativ.forms,
            ),
            CaseSentencePart(displayValue: 'si ljubazni'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Masculine,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Ali_on_je_pravi gospodin'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ali'),
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.on,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.on.nominativ.forms,
            ),
            CaseSentencePart(displayValue: 'je pravi gospodin'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Ona_je_jela'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ona,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.ona.nominativ.forms,
            ),
            CaseSentencePart(displayValue: 'je jela'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Mi_smo_braca'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.mi,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.mi.nominativ.forms,
            ),
            CaseSentencePart(displayValue: 'smo braća'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Vi_ste_prijatelji_moji'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.vi,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.mi.nominativ.forms,
            ),
            CaseSentencePart(displayValue: 'ste prijatelji moji'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Oni_idu_u_skolu'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.oni,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.oni.nominativ.forms,
            ),
            CaseSentencePart(displayValue: 'idu u školu'),
          ],
        ),
      ];

  List<PANCombo> get premium => [];
}
