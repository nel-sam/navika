import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative_pronouns.dart';
import 'package:navika/lang_data/words/ekavian/adjectives_ekavian.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/adjectives_ijekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal_pronouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class NominativExercises {
  late bool isCroatian;
  late bool isSerbian;
  final Cases caseType = Cases.Nom;

  NominativExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
    this.isSerbian = dialect == DialectType.Serbia;
  }

  List<PANCombo> get general => [
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.grad.gender,
            isPlural: true,
            isAnimate: false,
            extraInfo:
                N.t('extrainfo_most_short_nouns_get_ovi_suffix_in_plural'),
            translation: N.t('ex_Koji_su_najljepsi_gradovi_na_svijetu'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: DemonstrativePronouns.koji,
                displayValue: '',
                correctValues:
                    DemonstrativePronouns.koji.nominativ!.neuter!.plural,
                grammarType: GrammarTypes.demonstrativePronoun,
              ),
              CaseSentencePart(displayValue: 'su'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: isCroatian
                    ? AdjectivesIjekavian.najljepsi
                    : AdjectivesEkavian.najlepsi,
                displayValue: '',
                correctValues: isCroatian
                    ? AdjectivesIjekavian.najljepsi.nominativ!.neuter!.plural
                    : AdjectivesEkavian.najlepsi.nominativ!.neuter!.plural,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.grad,
                displayValue: '',
                correctValues: NounBankGeneral.grad.nominativ.plural,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'na svijetu?'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.jezero.gender,
            isPlural: true,
            isAnimate: false,
            translation: N.t('ex_Mala_jezera_počela_su_se_povecavati'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: AdjectiveBankGeneral.mali,
                displayValue: '',
                correctValues:
                    AdjectiveBankGeneral.mali.nominativ!.neuter!.plural,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.jezero,
                displayValue: '',
                correctValues: NounBankGeneral.jezero.nominativ.plural,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'počela su se povećavati'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: NounsIjekavian.kava.gender,
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
                    ? NounsIjekavian.kava.nominativ.singular
                    : NounsEkavian.kafa.nominativ.singular,
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
            gender: NounsIjekavian.sto.gender,
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
                    ? NounsIjekavian.sto.nominativ.singular
                    : NounsEkavian.sta.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'je to?'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: isCroatian
                ? NounsIjekavian.zrakoplov.gender
                : NounsEkavian.avion.gender,
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
                correctValues:
                    AdjectiveBankGeneral.star.nominativ!.masculine.singular,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject:
                    isCroatian ? NounsIjekavian.zrakoplov : NounsEkavian.avion,
                displayValue: '',
                correctValues: isCroatian
                    ? NounsIjekavian.zrakoplov.nominativ.singular
                    : NounsEkavian.avion.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'ima dva krila'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.francuska.gender,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_francuska_ima_oko_61_milijun_stanovnika'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.francuska,
                displayValue: '',
                correctValues: NounBankGeneral.francuska.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'ima oko 61 milijun stanovnika'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.bosna.gender,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_Bosna_i_Srbija_imaju_planine'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.bosna,
                displayValue: '',
                correctValues: NounBankGeneral.bosna.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'i'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.srbija,
                displayValue: '',
                correctValues: NounBankGeneral.srbija.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'imaju planine'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.lice.gender,
            isPlural: false,
            isAnimate: false,
            translation: N.t('ex_Lice_je_prednji_dio_glave'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.lice,
                displayValue: '',
                correctValues: NounBankGeneral.lice.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'je prednji dio glave'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.majka.gender,
            isPlural: false,
            isAnimate: true,
            translation: N.t('ex_Njezina_majka_je_žena_koja_voli_putovati'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: PossessivePronounBank.njezin,
                displayValue: '',
                correctValues:
                    PossessivePronounBank.njezin.nominativ!.feminine!.singular,
                grammarType: GrammarTypes.possessivePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.majka,
                displayValue: '',
                correctValues: NounBankGeneral.majka.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'je'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.zena,
                displayValue: '',
                correctValues: NounBankGeneral.zena.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'koja voli putovati'),
            ]),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.sestra.gender,
            isPlural: true,
            isAnimate: true,
            translation: N.t('ex_Moja_sestra_boje_se_biti_same'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: PossessivePronounBank.moj,
                displayValue: '',
                correctValues:
                    PossessivePronounBank.moj.nominativ!.feminine!.plural,
                grammarType: GrammarTypes.possessivePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.sestra,
                displayValue: '',
                correctValues: NounBankGeneral.sestra.nominativ.plural,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'se boje biti same'),
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
              correctValues: PersonalPronounWordBank.vi.nominativ.forms,
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

  List<PANCombo> get premium => [
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.bicikl.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_To_je_sestrin_novi_bicikl'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'To je'),
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.sestrin,
              grammarType: GrammarTypes.personalPronoun,
              correctValues:
                  AdjectiveBankGeneral.sestrin.nominativ!.masculine.singular,
            ),
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.nov,
              grammarType: GrammarTypes.personalPronoun,
              correctValues:
                  AdjectiveBankGeneral.nov.nominativ!.masculine.singular,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.bicikl,
              displayValue: '',
              correctValues: NounBankGeneral.bicikl.nominativ.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.pas.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Marijini_psi_nisu_dresirani'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.marijin,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.marijin.nominativ!.masculine.plural,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              displayValue: '',
              correctValues: NounBankGeneral.pas.nominativ.plural,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'nisu dresirani'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.torta.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Bakine_torte_su_najbolje'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.bakin,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.bakin.nominativ!.feminine!.plural,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.torta,
              displayValue: '',
              correctValues: NounBankGeneral.torta.nominativ.plural,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'su'),
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.najbolji,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.najbolji.nominativ!.feminine!.plural,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.sestra.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Denisova_sestra_nedavno_se_udala'),
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.denisov,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.denisov.nominativ!.feminine!.singular,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.sestra,
              displayValue: '',
              correctValues: NounBankGeneral.sestra.nominativ.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'nedavno se udala'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.jezero.gender,
          isPlural: false,
          isAnimate: false,
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: DemonstrativePronouns.koji,
              grammarType: GrammarTypes.demonstrativePronoun,
              correctValues:
                  DemonstrativePronouns.koji.nominativ!.neuter!.singular,
            ),
            CaseSentencePart(displayValue: 'je najbolje'),
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.balkanski,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.balkanski.nominativ!.neuter!.singular,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.jezero,
              displayValue: '',
              correctValues: NounBankGeneral.jezero.nominativ.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: '?'),
          ],
          translation: N.t('ex_Koje_je_najbolje_balkansko_jezero'),
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.selo.gender,
          isPlural: true,
          isAnimate: false,
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.japanski,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.japanski.nominativ!.neuter!.plural,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.selo,
              displayValue: '',
              correctValues: NounBankGeneral.selo.nominativ.plural,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'su lijepa'),
          ],
          translation: N.t('ex_Japanska_sela_su_lijepa'),
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.selo.gender,
          isPlural: false,
          isAnimate: false,
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ana je'),
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.marijin,
              grammarType: GrammarTypes.possessivePronoun,
              correctValues:
                  AdjectiveBankGeneral.marijin.nominativ!.masculine.singular,
            ),
            CaseSentencePart(displayValue: 'i'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.denisov,
              displayValue: '',
              correctValues:
                  AdjectiveBankGeneral.denisov.nominativ!.masculine.singular,
              grammarType: GrammarTypes.possessivePronoun,
            ),
            CaseSentencePart(displayValue: this.isSerbian ? 'dete' : 'dijete'),
          ],
          translation: N.t('ex_Ana_je_marijino_i_denisovo_dijete'),
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.majka.gender,
          isPlural: false,
          isAnimate: false,
          sentenceParts: [
            CaseSentencePart(
              displayValue: '',
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.anin,
              grammarType: GrammarTypes.possessivePronoun,
              correctValues:
                  AdjectiveBankGeneral.anin.nominativ!.feminine!.singular,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.majka,
              displayValue: '',
              correctValues: NounBankGeneral.majka.nominativ.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'je'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.hrvatica,
              displayValue: '',
              correctValues: NounBankGeneral.hrvatica.nominativ.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
          translation: N.t('ex_Anina_majka_je_hrvatica'),
        ),
      ];
}
