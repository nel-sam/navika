import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal_pronouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class InstrumentalExercises {
  late bool isCroatian;
  late bool isSerbian;
  final Cases caseType = Cases.Ins;

  InstrumentalExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
    this.isSerbian = dialect == DialectType.Serbia;
  }

  List<PANCombo> get general => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Sa_cime_treba_uzimati_vitamine'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Sa'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: isCroatian ? NounsIjekavian.sto : NounsEkavian.sta,
              displayValue: isCroatian
                  ? NounsIjekavian.sto.dictionary
                  : NounsEkavian.sta.dictionary,
              correctValues: isCroatian
                  ? NounsIjekavian.sto.instrumental.singular
                  : NounsEkavian.sta.instrumental.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'treba uzimati vitamine?'),
          ],
        ),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.meso.gender,
            isPlural: false,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Sviđa mi se burek s'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: AdjectiveBankGeneral.dobri,
                displayValue: AdjectiveBankGeneral.dobri.dictionary,
                correctValues:
                    AdjectiveBankGeneral.dobri.instrumental!.neuter!.singular,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.meso,
                displayValue: NounBankGeneral.meso.dictionary,
                correctValues: NounBankGeneral.meso.instrumental.singular,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Sviđa_mi_se_burek_s_dobrim_mesom')),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.pivo.gender,
            isPlural: true,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Krenuli smo s'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: AdjectiveBankGeneral.neki,
                displayValue: AdjectiveBankGeneral.neki.dictionary,
                correctValues:
                    AdjectiveBankGeneral.neki.instrumental!.neuter!.plural,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.pivo,
                displayValue: NounBankGeneral.pivo.dictionary,
                correctValues: NounBankGeneral.pivo.instrumental.plural,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Krenuli_smo_s_nekim_pivima')),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.sestra.gender,
            isPlural: false,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Moram ići sa'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: PossessivePronounBank.svoj,
                displayValue: PossessivePronounBank.svoj.dictionary,
                correctValues:
                    PossessivePronounBank.svoj.instrumental!.feminine!.singular,
                grammarType: GrammarTypes.possessivePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.sestra,
                displayValue: NounBankGeneral.sestra.dictionary,
                correctValues: NounBankGeneral.sestra.instrumental.singular,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Moram_ici_sa_svojom_sestrom')),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.macka.gender,
            isPlural: true,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Često šećem sa'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: PossessivePronounBank.svoj,
                displayValue: PossessivePronounBank.svoj.dictionary,
                correctValues:
                    PossessivePronounBank.svoj.instrumental!.feminine!.plural,
                grammarType: GrammarTypes.possessivePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: AdjectiveBankGeneral.crni,
                displayValue: AdjectiveBankGeneral.crni.dictionary,
                correctValues:
                    AdjectiveBankGeneral.crni.instrumental!.feminine!.plural,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.macka,
                displayValue: NounBankGeneral.macka.dictionary,
                correctValues: NounBankGeneral.macka.instrumental.plural,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Cesto_secem_sa_svojim_crnim_mackama')),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.ruka.gender,
            isPlural: true,
            sentenceParts: [
              CaseSentencePart(displayValue: isCroatian ? 'Što' : 'Šta'),
              CaseSentencePart(displayValue: 'ti je s'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.ruka,
                displayValue: NounBankGeneral.ruka.dictionary,
                correctValues: NounBankGeneral.ruka.instrumental.plural,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: '?'),
            ],
            isAnimate: false,
            translation: N.t('ex_Sto_ti_je_s_rukama')),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.bicikl.gender,
            isPlural: false,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Na posao putujem'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: PossessivePronounBank.svoj,
                displayValue: PossessivePronounBank.svoj.dictionary,
                correctValues:
                    PossessivePronounBank.svoj.instrumental!.masculine.singular,
                grammarType: GrammarTypes.possessivePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: AdjectiveBankGeneral.brzi,
                displayValue: AdjectiveBankGeneral.brzi.dictionary,
                correctValues:
                    AdjectiveBankGeneral.brzi.instrumental!.masculine.singular,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.bicikl,
                displayValue: NounBankGeneral.bicikl.dictionary,
                correctValues: NounBankGeneral.bicikl.instrumental.singular,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Na_posao_putujem_svojim_brzim_biciklom')),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.krevet.gender,
            isPlural: true,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Imaju sobu s'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: AdjectiveBankGeneral.mali,
                displayValue: AdjectiveBankGeneral.mali.dictionary,
                correctValues:
                    AdjectiveBankGeneral.mali.instrumental!.masculine.plural,
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.krevet,
                displayValue: NounBankGeneral.krevet.dictionary,
                correctValues: NounBankGeneral.krevet.instrumental.plural,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Imaju_sobu_s_malim_krevetima')),
      ];

  List<PANCombo> get personalPronouns => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Pođi_sa_mnom'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Pođi sa'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              displayValue: PersonalPronounWordBank.ja.dictionary,
              correctValues: PersonalPronounWordBank.ja.instrumental.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Rucat_cu_s_tobom'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ručat ću s'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ti,
              displayValue: PersonalPronounWordBank.ti.dictionary,
              correctValues: PersonalPronounWordBank.ti.instrumental.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Masculine,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Imao_sam_osobno_jednu_situaciju_s_njim'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Imao sam osobno jednu situaciju s'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.on,
              displayValue: PersonalPronounWordBank.on.dictionary,
              correctValues: PersonalPronounWordBank.on.instrumental.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Dosla_je_nova_godina_a_s_njom_i_novi_trendovi'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Došla je nova godina, a s'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ona,
              displayValue: PersonalPronounWordBank.ona.dictionary,
              correctValues: PersonalPronounWordBank.ona.instrumental.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'i novi trendovi'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Razgovarajte_s_nama'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Razgovarajte s'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.mi,
              displayValue: PersonalPronounWordBank.mi.dictionary,
              correctValues: PersonalPronounWordBank.mi.instrumental.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Sretan_sam_sto_sam_danas_s_vama'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Sretan sam što sam danas s'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.vi,
              displayValue: PersonalPronounWordBank.vi.dictionary,
              correctValues: PersonalPronounWordBank.vi.instrumental.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Doznali_smo_sto_je_s_njima'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Doznali smo što je s'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.oni,
              displayValue: PersonalPronounWordBank.oni.dictionary,
              correctValues: PersonalPronounWordBank.oni.instrumental.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
      ];

  List<PANCombo> get premium => [
        // TODO: Possesives

// TODO: Nationality nouns
      ];
}
