import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative_pronouns.dart';
import 'package:navika/lang_data/words/ekavian/adjectives_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/adjectives_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal_pronouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class MixedExercises {
  late bool isCroatian;
  late bool isSerbian;
  final Cases caseType = Cases.Unspecified;

  MixedExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
    this.isSerbian = dialect == DialectType.Serbia;
  }

  // TODO: Add more exercises
  List<PANCombo> get all => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Masculine,
          isPlural: false,
          isAnimate: false,
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
              caseType: Cases.Dat,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.grad,
              displayValue: NounBankGeneral.grad.dictionary,
              correctValues: NounBankGeneral.grad.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Masculine,
          isPlural: false,
          isAnimate: false,
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
              caseType: Cases.Dat,
            ),
            CaseSentencePart(displayValue: 'malo'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.vruc,
              displayValue: AdjectiveBankGeneral.vruc.dictionary,
              correctValues:
                  AdjectiveBankGeneral.vruc.genitiv!.masculine.singular,
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.caj,
              displayValue: NounBankGeneral.caj.dictionary,
              correctValues: NounBankGeneral.caj.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
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
              caseType: Cases.Dat,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.bolnica,
              displayValue: NounBankGeneral.bolnica.dictionary,
              correctValues: NounBankGeneral.bolnica.dativ!.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Dat,
            ),
            CaseSentencePart(displayValue: 'se nalazi'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pekara,
              displayValue: '',
              correctValues: NounBankGeneral.pekara.nominativ.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Nom,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.pas.gender,
          isPlural: false,
          isAnimate: false,
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
              caseType: Cases.Dat,
            ),
            CaseSentencePart(displayValue: 'moj'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.prvi,
              displayValue: '',
              correctValues:
                  AdjectiveBankGeneral.prvi.nominativ!.masculine.singular,
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              displayValue: '',
              correctValues: NounBankGeneral.pas.nominativ.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Nom,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Poslao_sam_dugo_pismo_svojoj_majci'),
          // Poslao sam dugo pismo svojoj majci
          sentenceParts: [
            CaseSentencePart(displayValue: 'Poslao sam'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.dugi,
              displayValue: AdjectiveBankGeneral.dugi.dictionary,
              correctValues:
                  AdjectiveBankGeneral.dugi.akuzativ!.neuter!.singular,
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(displayValue: 'pismo'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PossessivePronounBank.svoj,
              displayValue: PossessivePronounBank.svoj.dictionary,
              correctValues:
                  PossessivePronounBank.svoj.dativ!.feminine!.singular,
              grammarType: GrammarTypes.possessivePronoun,
              caseType: Cases.Dat,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.majka,
              displayValue: NounBankGeneral.majka.dictionary,
              correctValues: NounBankGeneral.majka.dativ!.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Dat,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.pas.gender,
          isPlural: false,
          isAnimate: true,
          extraInfo: N.t('extrainfo_akusativ_for_male_animate'),
          translation: N.t('ex_Udomila_sam_starog_psa_sa_ceste'),
          // Udomila sam starog psa sa ceste
          sentenceParts: [
            CaseSentencePart(displayValue: 'Udomila sam'),
            CaseSentencePart(
              displayValue: AdjectiveBankGeneral.star.dictionary,
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.star,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.star.genitiv!.masculine.singular,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.pas.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.pas.genitiv.singular,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(displayValue: 'sa ceste'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Koja_je_vrsta_kreveta_prava_za_vas'),
          // Koja je vrsta kreveta prava za vas
          sentenceParts: [
            CaseSentencePart(
              displayValue: DemonstrativePronouns.koji.dictionary,
              isCorrectable: true,
              actualObject: DemonstrativePronouns.koji,
              grammarType: GrammarTypes.demonstrativePronoun,
              correctValues:
                  DemonstrativePronouns.koji.nominativ!.feminine!.singular,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(displayValue: 'je vrsta'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.krevet,
              displayValue: '',
              correctValues: NounBankGeneral.krevet.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(displayValue: 'prava za'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.vi,
              displayValue: '',
              correctValues: PersonalPronounWordBank.vi.akuzativ.forms,
              grammarType: GrammarTypes.personalPronoun,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(displayValue: '?')
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Prije_16_godina_udomio_sam_pse_sa_ceste'),
          // Prije 16 godina udomio sam pse sa ceste
          extraInfo:
              N.t('extrainfo_use_genitiv_after_sa_when_saying_from_somewhere'),
          sentenceParts: [
            CaseSentencePart(
                displayValue: '${isSerbian ? 'Pre' : 'Prije'} 16 (šesnaest)'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: NounBankGeneral.godina.dictionary,
              correctValues: NounBankGeneral.godina.genitiv.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(displayValue: 'udomio sam'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              displayValue: NounBankGeneral.pas.dictionary,
              correctValues: NounBankGeneral.pas.akuzativ.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(displayValue: 'sa'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.cesta,
              displayValue: NounBankGeneral.cesta.dictionary,
              correctValues: NounBankGeneral.cesta.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
              forcedPlurality: Plurality.Singular,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Otac_je_polako_otisao_od_kuce'),
          // Otac je polako otišao od kuće
          sentenceParts: [
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.otac,
              displayValue: '',
              correctValues: NounBankGeneral.otac.nominativ.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(displayValue: 'je polako otišao od'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.kuca,
              displayValue: NounBankGeneral.kuca.dictionary,
              correctValues: NounBankGeneral.kuca.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          translation: N.t('ex_Vidjeli_smo_lijepe_jezera_u_Bosni'),
          // Vidjeli smo lijepe jezera u Bosni
          gender: NounBankGeneral.jezero.gender,
          isPlural: false,
          isAnimate: true,
          sentenceParts: [
            CaseSentencePart(displayValue: 'Vidjeli smo'),
            CaseSentencePart(
              displayValue: isSerbian
                  ? AdjectivesEkavian.lep.dictionary
                  : AdjectivesIjekavian.lijep.dictionary,
              isCorrectable: true,
              actualObject:
                  isSerbian ? AdjectivesEkavian.lep : AdjectivesIjekavian.lijep,
              grammarType: GrammarTypes.adjective,
              correctValues: isSerbian
                  ? AdjectivesEkavian.lep.akuzativ!.neuter!.plural
                  : AdjectivesIjekavian.lijep.akuzativ!.neuter!.plural,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.jezero.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.jezero,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.jezero.akuzativ.plural,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(displayValue: 'u'),
            CaseSentencePart(
              displayValue: NounBankGeneral.bosna.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.bosna,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.bosna.lokativ.singular,
              caseType: Cases.Lok,
            ),
          ],
        ),
      ];
}
