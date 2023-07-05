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

class GenitivExercises {
  late bool isCroatian;
  final Cases caseType = Cases.Gen;

  GenitivExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
  }

  List<PANCombo> get general => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Sport_je_jedino_bez_cega_ne_mozemo'),
          // Sport je jedino bez čega ne možemo.
          sentenceParts: [
            CaseSentencePart(displayValue: 'Sport je jedino bez'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: isCroatian ? NounsIjekavian.sto : NounsEkavian.sta,
              displayValue: isCroatian
                  ? NounsIjekavian.sto.dictionary
                  : NounsEkavian.sta.dictionary,
              correctValues: isCroatian
                  ? NounsIjekavian.sto.genitiv.singular
                  : NounsEkavian.sta.genitiv.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'ne možemo'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.grad.gender,
          isPlural: false,
          translation: N.t('ex_Idemo_prema_centru_grada'),
          // Idemo prema centru grada
          sentenceParts: [
            CaseSentencePart(displayValue: 'Idemo prema centru'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.grad,
              displayValue: NounBankGeneral.grad.dictionary,
              correctValues: NounBankGeneral.grad.genitiv.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.knjiga.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Ovo_mi_je_jedna_od_najboljih_knjiga'),
          // Ovo mi je jedna od najboljih knjiga
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ovo mi je jedna od'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.najbolji,
              displayValue: AdjectiveBankGeneral.najbolji.dictionary,
              correctValues:
                  AdjectiveBankGeneral.najbolji.genitiv!.feminine!.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.knjiga,
              displayValue: NounBankGeneral.knjiga.dictionary,
              correctValues: NounBankGeneral.knjiga.genitiv.plural,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.telefon.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Kupit_cu_3_bolja_telefona'),
          // Kupit ću 3 bolja telefona
          sentenceParts: [
            CaseSentencePart(displayValue: 'Kupit ću 3'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.bolji,
              displayValue: AdjectiveBankGeneral.bolji.dictionary,
              correctValues:
                  AdjectiveBankGeneral.bolji.genitiv!.masculine.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.telefon,
              displayValue: NounBankGeneral.telefon.dictionary,
              correctValues: NounBankGeneral.telefon.genitiv.plural,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.otac.gender,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Ja_sam_iza_oca'),
          // Ja sam iza oca
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ja sam iza'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.otac,
              displayValue: NounBankGeneral.otac.dictionary,
              correctValues: NounBankGeneral.otac.genitiv.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.krevet.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Koja_je_vrsta_kreveta_prava_za_vas'),
          // Koja je vrsta kreveta prava za vas?
          sentenceParts: [
            CaseSentencePart(displayValue: 'Koja je vrsta'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.krevet,
              displayValue: NounBankGeneral.krevet.dictionary,
              correctValues: NounBankGeneral.krevet.genitiv.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'prava za vas?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Mogu_li_dobiti_malo_te_slatke_torte'),
          // Mogu li dobiti malo te slatke torte?
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
              displayValue: AdjectiveBankGeneral.sladak.dictionary,
              correctValues:
                  AdjectiveBankGeneral.sladak.genitiv!.feminine!.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.torta,
              displayValue: NounBankGeneral.torta.dictionary,
              correctValues: NounBankGeneral.torta.genitiv.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: "?"),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.pravilo.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Ova_skola_nema_stroga_pravila'),
          // Ova škola nema stroga pravila
          sentenceParts: [
            CaseSentencePart(displayValue: "Ova škola nema"),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.strogi,
              displayValue: AdjectiveBankGeneral.strogi.dictionary,
              correctValues:
                  AdjectiveBankGeneral.strogi.genitiv!.neuter!.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pravilo,
              displayValue: NounBankGeneral.pravilo.dictionary,
              correctValues: NounBankGeneral.pravilo.genitiv.plural,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.more.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Pretvorilo_se_jedno_od_najvecih_mora'),
          // Pretvorilo se jedno od najvećih mora
          sentenceParts: [
            CaseSentencePart(displayValue: "Pretvorilo se jedno od"),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.najveci,
              displayValue: AdjectiveBankGeneral.najveci.dictionary,
              correctValues:
                  AdjectiveBankGeneral.najveci.genitiv!.neuter!.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.more,
              displayValue: NounBankGeneral.more.dictionary,
              correctValues: NounBankGeneral.more.genitiv.plural,
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
          isAnimate: true,
          translation: N.t('ex_Stani_iza_mene'),
          // Stani iza mene!
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
          // S tobom ili bez tebe
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
          // Zbog njega sam nosio masku
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
          // Kako ću živjeti bez nje?
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
          // Svatko od nas ima nešto dobro
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
          // To može biti na putu do vas
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
          // Kod njih je sve obrnuto
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

  List<PANCombo> get premium => [
        // TODO: Possesives
        // TODO: Nationality nouns
      ];
}
