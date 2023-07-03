import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative_pronouns.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal_pronouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class DativExercises {
  late bool isCroatian;
  late bool isSerbian;
  final Cases caseType = Cases.Dat;

  DativExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
    this.isSerbian = dialect == DialectType.Serbia;
  }

  List<PANCombo> get general => [
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.pas.gender,
          isPlural: false,
          translation: N.t('ex_Kojem_psu_da_dam_igracku'),
          // Kojem psu da dam igračku?
          sentenceParts: [
            CaseSentencePart(
              isCorrectable: true,
              actualObject: DemonstrativePronouns.koji,
              displayValue: DemonstrativePronouns.koji.dictionary,
              correctValues:
                  DemonstrativePronouns.koji.dativ!.masculine.singular,
              grammarType: GrammarTypes.demonstrativePronoun,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              displayValue: NounBankGeneral.pas.dictionary,
              correctValues: NounBankGeneral.pas.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'da dam igračku?'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.macka.gender,
          isPlural: false,
          translation: N.t('ex_Kojoj_macki_da_dam_hranu'),
          // Kojoj mački da dam hranu?
          sentenceParts: [
            CaseSentencePart(
              isCorrectable: true,
              actualObject: DemonstrativePronouns.koji,
              displayValue: DemonstrativePronouns.koji.dictionary,
              correctValues:
                  DemonstrativePronouns.koji.dativ!.feminine!.singular,
              grammarType: GrammarTypes.demonstrativePronoun,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.macka,
              displayValue: NounBankGeneral.macka.dictionary,
              correctValues: NounBankGeneral.macka.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'da dam hranu?'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.sin.gender,
          isPlural: true,
          extraInfo: N.t('extrainfo_most_short_nouns_get_ovi_suffix_in_plural'),
          translation: N.t('ex_Moji_mladim_sinovima_je_dosadno'),
          // Moji mladim sinovima je dosadno.
          sentenceParts: [
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PossessivePronounBank.moj,
              displayValue: PossessivePronounBank.moj.dictionary,
              correctValues: PossessivePronounBank.moj.dativ!.masculine.plural,
              grammarType: GrammarTypes.possessivePronoun,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.mladi,
              displayValue: AdjectiveBankGeneral.mladi.dictionary,
              correctValues: AdjectiveBankGeneral.mladi.dativ!.masculine.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.sin,
              displayValue: NounBankGeneral.sin.dictionary,
              correctValues: NounBankGeneral.sin.dativ!.plural,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'je dosadno'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.poklon.gender,
          isPlural: false,
          translation: N.t('ex_Nadam se_nekom_poklonu'),
          // Nadam se nekom poklonu
          sentenceParts: [
            CaseSentencePart(displayValue: 'Nadam se'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.neki,
              displayValue: AdjectiveBankGeneral.neki.dictionary,
              correctValues:
                  AdjectiveBankGeneral.neki.dativ!.masculine.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.poklon,
              displayValue: NounBankGeneral.poklon.dictionary,
              correctValues: NounBankGeneral.poklon.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.centar.gender,
          isPlural: false,
          translation: N.t('ex_Idemo_prema_centru_grada'),
          // Idemo prema centru grada
          sentenceParts: [
            CaseSentencePart(displayValue: 'Idemo prema'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.centar,
              displayValue: NounBankGeneral.centar.dictionary,
              correctValues: NounBankGeneral.centar.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'grada'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.jezero.gender,
          isPlural: true,
          translation: N.t('ex_Idem_prema_velikim_jezerima'),
          // Idem prema velikim jezerima
          sentenceParts: [
            CaseSentencePart(displayValue: 'Idem prema'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.velik,
              displayValue: AdjectiveBankGeneral.velik.dictionary,
              correctValues: AdjectiveBankGeneral.velik.dativ!.neuter!.plural,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.jezero,
              displayValue: NounBankGeneral.jezero.dictionary,
              correctValues: NounBankGeneral.jezero.dativ!.plural,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: isCroatian
              ? NounsIjekavian.ljeto.gender
              : NounsEkavian.leto.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Radujem_se_vrućem_ljetu'),
          // Radujem se vrućem ljetu
          sentenceParts: [
            CaseSentencePart(displayValue: 'Radujem se'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.vruc,
              displayValue: AdjectiveBankGeneral.vruc.dictionary,
              correctValues: AdjectiveBankGeneral.vruc.dativ!.neuter!.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject:
                  !isSerbian ? NounsIjekavian.ljeto : NounsEkavian.leto,
              displayValue: !isSerbian
                  ? NounsIjekavian.ljeto.dictionary
                  : NounsEkavian.leto.dictionary,
              correctValues: !isSerbian
                  ? NounsIjekavian.ljeto.dativ!.singular
                  : NounsEkavian.leto.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.bolnica.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Nasuprot_velikoj_bolnici_se_nalazi_pekara'),
          // Nasuprot velikoj bolnici se nalazi pekara
          sentenceParts: [
            CaseSentencePart(displayValue: 'Nasuprot'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.velik,
              displayValue: AdjectiveBankGeneral.velik.dictionary,
              correctValues:
                  AdjectiveBankGeneral.velik.dativ!.feminine!.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.bolnica,
              displayValue: NounBankGeneral.bolnica.dictionary,
              correctValues: NounBankGeneral.bolnica.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'se nalazi pekara'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.zivot.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Sto_je_u_zivotu_vazno'),
          // Što/Šta je u životu važno?
          sentenceParts: [
            CaseSentencePart(displayValue: this.isCroatian ? 'Što' : 'Šta'),
            CaseSentencePart(displayValue: 'je u'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.zivot,
              displayValue: NounBankGeneral.zivot.dictionary,
              correctValues: NounBankGeneral.zivot.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'važno?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.jesen.gender,
          isPlural: false,
          extraInfo: N.t('extrainfo_noun_seems_masc_but_declines_fem'),
          translation: N.t('ex_Veselim_se_jeseni'),
          // Veselim se jeseni
          sentenceParts: [
            CaseSentencePart(displayValue: 'Veselim se'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.jesen,
              displayValue: NounBankGeneral.jesen.dictionary,
              correctValues: NounBankGeneral.jesen.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          translation: N.t('ex_Nema_na_cemu'),
          // Nema na čemu
          sentenceParts: [
            CaseSentencePart(displayValue: 'Nema na'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: isCroatian ? NounsIjekavian.sto : NounsEkavian.sta,
              displayValue: isCroatian
                  ? NounsIjekavian.sto.dictionary
                  : NounsEkavian.sta.dictionary,
              correctValues: isCroatian
                  ? NounsIjekavian.sto.dativ!.singular
                  : NounsEkavian.sta.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.majka.gender,
          isPlural: false,
          translation: N.t('ex_Poslao_sam_dugo_pismo_svojoj_majci'),
          // Poslao sam dugo pismo svojoj majci
          sentenceParts: [
            CaseSentencePart(displayValue: 'Poslao sam dugo pismo'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PossessivePronounBank.svoj,
              displayValue: PossessivePronounBank.svoj.dictionary,
              correctValues:
                  PossessivePronounBank.svoj.dativ!.feminine!.singular,
              grammarType: GrammarTypes.possessivePronoun,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.majka,
              displayValue: NounBankGeneral.majka.dictionary,
              correctValues: NounBankGeneral.majka.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.sestra.gender,
          isPlural: true,
          translation: N.t('ex_Poslao_sam_poklone_tvojim_sestrama'),
          // Poslao sam poklone tvojim sestrama
          sentenceParts: [
            CaseSentencePart(displayValue: 'Poslao sam poklone'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PossessivePronounBank.tvoj,
              displayValue: PossessivePronounBank.tvoj.dictionary,
              correctValues: PossessivePronounBank.tvoj.dativ!.feminine!.plural,
              grammarType: GrammarTypes.possessivePronoun,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.sestra,
              displayValue: NounBankGeneral.sestra.dictionary,
              correctValues: NounBankGeneral.sestra.dativ!.plural,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
        ),
      ];

  List<PANCombo> get personalPronouns => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          translation: N.t('ex_Treba_mi_pauza'),
          // Treba mi pauza
          sentenceParts: [
            CaseSentencePart(displayValue: 'Treba'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              displayValue: PersonalPronounWordBank.ja.dictionary,
              correctValues: PersonalPronounWordBank.ja.dativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'pauza'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          translation: N.t('ex_Nedostaje_mi_moj_prvi_pas'),
          // Nedostaje mi moj prvi pas
          sentenceParts: [
            CaseSentencePart(displayValue: 'Nedostaje'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              displayValue: PersonalPronounWordBank.ja.dictionary,
              correctValues: ['mi'],
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'moj prvi pas'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          translation: N.t('ex_Je_li_ti_vazno'),
          // Je li ti važno?
          sentenceParts: [
            CaseSentencePart(displayValue: 'Je li'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ti,
              displayValue: PersonalPronounWordBank.ti.dictionary,
              correctValues: PersonalPronounWordBank.ti.dativ.forms,
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'važno?'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Masculine,
          isPlural: false,
          translation: N.t('ex_Molim_te_daj_mu_malo_vruceg_caja'),
          // Molim te, daj mu malo vrućeg čaja
          sentenceParts: [
            CaseSentencePart(displayValue: 'Molim te, daj'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.on,
              displayValue: PersonalPronounWordBank.on.dictionary,
              correctValues: ['mu'],
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'malo vrućeg čaja'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          translation: N.t('ex_Daj_joj_moj_broj_telefona'),
          // Daj joj moj broj telefona
          sentenceParts: [
            CaseSentencePart(displayValue: 'Daj'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ona,
              displayValue: PersonalPronounWordBank.ona.dictionary,
              correctValues: ['joj'],
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'moj broj telefona'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          translation: N.t('ex_Javni_prijevoz_nam_je_vazan'),
          // Javni prijevoz nam je važan
          sentenceParts: [
            CaseSentencePart(displayValue: 'Javni prijevoz'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.mi,
              displayValue: PersonalPronounWordBank.mi.dictionary,
              correctValues: ['nam'],
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'je važan'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          translation: N.t('ex_Treba_vam_brza_pomoc'),
          // Treba vam brza pomoć?
          sentenceParts: [
            CaseSentencePart(displayValue: 'Treba'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.vi,
              displayValue: PersonalPronounWordBank.vi.dictionary,
              correctValues: ['vam'],
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'brza pomoć?'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          translation: N.t('ex_Je_li_im_zdravlje_vazno'),
          // Je li im zdravlje važno?
          sentenceParts: [
            CaseSentencePart(displayValue: 'Je li'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.oni,
              displayValue: PersonalPronounWordBank.oni.dictionary,
              correctValues: ['im'],
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'zdravlje važno?'),
          ],
          isAnimate: false,
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          extraInfo: N.t('extrainfo_long_form_of_pronouns'),
          translation: N.t('ex_Meni_je_dosadno'),
          // Meni je dosadno
          sentenceParts: [
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              displayValue: PersonalPronounWordBank.ja.dictionary,
              correctValues: ['meni'],
              grammarType: GrammarTypes.personalPronoun,
            ),
            CaseSentencePart(displayValue: 'je dosadno'),
          ],
          isAnimate: false,
        ),
      ];

  List<PANCombo> get premium => [
        // TODO: Possesives
        // TODO: Nationality nouns
      ];
}
