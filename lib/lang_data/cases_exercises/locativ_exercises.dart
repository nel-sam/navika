import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative_pronouns.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal_pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class LokativExercises {
  late bool isCroatian;
  late bool isSerbian;
  final Cases caseType = Cases.Lok;

  LokativExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
    this.isSerbian = dialect == DialectType.Serbia;
  }

  List<PANCombo> get general => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_O_cemu_govorite'),
          // O čemu govorite?
          sentenceParts: [
            CaseSentencePart(displayValue: 'O'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: isCroatian ? NounsIjekavian.sto : NounsEkavian.sta,
              displayValue: isCroatian
                  ? NounsIjekavian.sto.dictionary
                  : NounsEkavian.sta.dictionary,
              correctValues: isCroatian
                  ? NounsIjekavian.sto.lokativ.singular
                  : NounsEkavian.sta.lokativ.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'govorite?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.grad.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_U_kojem_gradu_se_nalazite'),
          // U kojem gradu se nalazite?
          sentenceParts: [
            CaseSentencePart(displayValue: 'U'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: DemonstrativePronouns.koji,
              displayValue: DemonstrativePronouns.koji.dictionary,
              correctValues:
                  DemonstrativePronouns.koji.lokativ!.masculine.singular,
              grammarType: GrammarTypes.demonstrativePronoun,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.grad,
              displayValue: NounBankGeneral.grad.dictionary,
              correctValues: NounBankGeneral.grad.lokativ.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'se nalazite?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.jezero.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Zivite_li_u_malom_selu_ili_u_velikom_gradu'),
          // Živite li u malom selu ili u velikom gradu?
          sentenceParts: [
            CaseSentencePart(displayValue: 'Živite li u'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.mali,
              displayValue: AdjectiveBankGeneral.mali.dictionary,
              correctValues:
                  AdjectiveBankGeneral.mali.lokativ!.neuter!.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.selo,
              displayValue: NounBankGeneral.selo.dictionary,
              correctValues: NounBankGeneral.selo.lokativ.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'ili u velikom gradu?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.jezero.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Volim_plivati_u_toplim_jezerima'),
          // Volim plivati u toplim jezerima
          sentenceParts: [
            CaseSentencePart(displayValue: 'Volim plivati u'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.topao,
              displayValue: AdjectiveBankGeneral.topao.dictionary,
              correctValues: AdjectiveBankGeneral.topao.lokativ!.neuter!.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.jezero,
              displayValue: NounBankGeneral.jezero.dictionary,
              correctValues: NounBankGeneral.jezero.lokativ.plural,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.ruka.gender,
          isPlural: false,
          translation: N.t('ex_Sto_ti_je_u_desnoj_ruci'),
          // Što/Šta ti je u desnoj ruci?
          sentenceParts: [
            CaseSentencePart(displayValue: isCroatian ? 'Što' : 'Šta'),
            CaseSentencePart(displayValue: 'ti je u'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.desni,
              displayValue: AdjectiveBankGeneral.desni.dictionary,
              correctValues:
                  AdjectiveBankGeneral.desni.lokativ!.feminine!.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.ruka,
              displayValue: NounBankGeneral.ruka.dictionary,
              correctValues: NounBankGeneral.ruka.lokativ.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.ruka.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Prodaju_burek_po_balkanskim_pekarama'),
          // Prodaju burek po balkanskim pekarama
          sentenceParts: [
            CaseSentencePart(displayValue: 'Prodaju burek po'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.balkanski,
              displayValue: AdjectiveBankGeneral.balkanski.dictionary,
              correctValues:
                  AdjectiveBankGeneral.balkanski.lokativ!.feminine!.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pekara,
              displayValue: NounBankGeneral.pekara.dictionary,
              correctValues: NounBankGeneral.pekara.lokativ.plural,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.krevet.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Macka_spava_na_starom_krevetu'),
          // Mačka spava na starom krevetu
          sentenceParts: [
            CaseSentencePart(displayValue: 'Mačka spava na'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.star,
              displayValue: AdjectiveBankGeneral.star.dictionary,
              correctValues:
                  AdjectiveBankGeneral.star.lokativ!.masculine.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.krevet,
              displayValue: NounBankGeneral.krevet.dictionary,
              correctValues: NounBankGeneral.krevet.lokativ.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.pas.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Govorimo_o_malim_psima'),
          // Govorimo o malim psima
          sentenceParts: [
            CaseSentencePart(displayValue: 'Govorimo o'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.mali,
              displayValue: AdjectiveBankGeneral.mali.dictionary,
              correctValues:
                  AdjectiveBankGeneral.mali.lokativ!.masculine.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              displayValue: NounBankGeneral.pas.dictionary,
              correctValues: NounBankGeneral.pas.lokativ.plural,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
      ];

  List<PANCombo> get personalPronouns => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Ne_pricaj_o_meni_molim_te'),
          // Ne pričaj o meni, molim te
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ne pričaj o'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              displayValue: PersonalPronounWordBank.ja.dictionary,
              correctValues: PersonalPronounWordBank.ja.lokativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: ', molim te'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Jucer_su_pricali_o_tebi'),
          // Jučer su pričali o tebi
          sentenceParts: [
            CaseSentencePart(displayValue: 'Jučer su pričali o'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ti,
              displayValue: PersonalPronounWordBank.ti.dictionary,
              correctValues: PersonalPronounWordBank.ti.lokativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Masculine,
          isPlural: false,
          isAnimate: false,
          translation: N.t('Po njemu se isplati kupiti'),
          // Po njemu se isplati kupiti
          sentenceParts: [
            CaseSentencePart(displayValue: 'Po'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.on,
              displayValue: PersonalPronounWordBank.on.dictionary,
              correctValues: PersonalPronounWordBank.on.lokativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'isplati kupiti'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Govorimo_o_njoj'),
          // Govorimo o njoj
          sentenceParts: [
            CaseSentencePart(displayValue: 'Govorimo o'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ona,
              displayValue: PersonalPronounWordBank.ona.dictionary,
              correctValues: PersonalPronounWordBank.ona.lokativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Ona_ide_prema_nama'),
          // Ona ide prema nama
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ona ide prema'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.mi,
              displayValue: PersonalPronounWordBank.mi.dictionary,
              correctValues: PersonalPronounWordBank.mi.lokativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Vas_pas_se_naginje_prema_vama'),
          // Vaš pas se naginje prema vama
          sentenceParts: [
            CaseSentencePart(displayValue: 'Vaš pas se naginje prema'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.vi,
              displayValue: PersonalPronounWordBank.vi.dictionary,
              correctValues: PersonalPronounWordBank.vi.lokativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Zivotinje_su_svjesne_kretanja_prema_njima'),
          // Životinje su svjesne kretanja prema njima
          sentenceParts: [
            CaseSentencePart(
                displayValue: 'Životinje su svjesne kretanja prema'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.oni,
              displayValue: PersonalPronounWordBank.oni.dictionary,
              correctValues: PersonalPronounWordBank.oni.lokativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
          ],
        ),
      ];

  List<PANCombo> get premium => [
        // TODO: Possesives
        //// TODO: Nationality nouns
      ];
}
