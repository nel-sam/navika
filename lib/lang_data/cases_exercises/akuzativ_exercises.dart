import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative-pronouns.dart';
import 'package:navika/lang_data/words/ekavian/adjectives_ekavian.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/adjectives_ijekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal-pronouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class AkuzativExercises {
  late bool isCroatian;
  late bool isSerbian;
  final Cases caseType = Cases.Aku;

  AkuzativExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
    this.isSerbian = dialect == DialectType.Serbia;
  }

  List<PANCombo> get general => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Sto_jedes'),
          sentenceParts: [
            CaseSentencePart(
                isCorrectable: true,
                actualObject:
                    isCroatian ? NounsIjekavian.sto : NounsEkavian.sta,
                displayValue: isCroatian
                    ? NounsIjekavian.sto.dictionary
                    : NounsEkavian.sta.dictionary,
                correctValues: isCroatian
                    ? NounsIjekavian.sto.akuzativ.singular
                    : NounsEkavian.sta.akuzativ.singular,
                grammarType: GrammarTypes.noun,
              ),
            CaseSentencePart(displayValue: 'jedeš?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.bosna.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Idemo_u_Bosnu'),
          extraInfo: N.t('extrainfo_aku_for_movement'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Idemo u'),
            CaseSentencePart(
              displayValue: NounBankGeneral.bosna.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.bosna,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.bosna.akuzativ.singular,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.bicikl.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Slikao_sam_svoj_bicikl'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Slikao sam'),
            CaseSentencePart(
              displayValue: PossessivePronounBank.svoj.dictionary,
              isCorrectable: true,
              actualObject: PossessivePronounBank.svoj,
              grammarType: GrammarTypes.possessivePronoun,
              correctValues:
                  PossessivePronounBank.svoj.akuzativ!.masculine.singular,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.bicikl.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.bicikl,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.bicikl.akuzativ.singular,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.krevet.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Jeste_li_kupili_novi_krevet'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Jeste li kupili'),
            CaseSentencePart(
              displayValue: AdjectiveBankGeneral.nov.dictionary,
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.nov,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.nov.akuzativ!.masculine.singular,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.krevet.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.krevet,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.krevet.akuzativ.singular,
            ),
            CaseSentencePart(displayValue: '?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.ananas.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Jedeš_li_ananas'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Jedeš li ananas'),
            CaseSentencePart(
              displayValue: NounBankGeneral.ananas.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.ananas,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.ananas.akuzativ.singular,
            ),
            CaseSentencePart(displayValue: '?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.bolest.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Mrzim_bolesti'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Mrzim'),
            CaseSentencePart(
              displayValue: NounBankGeneral.bolest.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.bolest,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.bolest.akuzativ.plural,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.bolnica.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Grad_je_izgradio_bolnicu'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Grad je izgradio'),
            CaseSentencePart(
              displayValue: NounBankGeneral.bolnica.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.bolnica,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.bolnica.akuzativ.singular,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.bosna.gender,
          isPlural: false,
          isAnimate: false,
          extraInfo: N.t('extrainfo_akuzativ_with_za'),
          translation: N.t('ex_Sviđa_mi_se_pjesme_za_bosnu'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Sviđa mi se pjesme za'),
            CaseSentencePart(
              displayValue: NounBankGeneral.bosna.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.bosna,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.bosna.akuzativ.singular,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.pivo.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Moram_pronaci_pivo'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Moram pronaći'),
            CaseSentencePart(
              displayValue: NounBankGeneral.pivo.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.pivo,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.pivo.akuzativ.singular,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.torta.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Ne_znas_koje_torte_odabrati'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ne znaš'),
            CaseSentencePart(
              displayValue: DemonstrativePronouns.koji.dictionary,
              isCorrectable: true,
              actualObject: DemonstrativePronouns.koji,
              grammarType: GrammarTypes.demonstrativePronoun,
              correctValues:
                  DemonstrativePronouns.koji.akuzativ!.feminine!.plural,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.torta.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.torta,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.torta.akuzativ.plural,
            ),
            CaseSentencePart(displayValue: 'odabrati?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.macka.gender,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Zelim_kupiti_bijele_macke'),
          sentenceParts: [
            CaseSentencePart(
                displayValue: !isSerbian ? 'Želim kupiti' : 'Želim da kupim'),
            CaseSentencePart(
              displayValue: !isSerbian
                  ? AdjectivesIjekavian.bijel.dictionary
                  : AdjectivesEkavian.bel.dictionary,
              isCorrectable: true,
              actualObject: !isSerbian
                  ? AdjectivesIjekavian.bijel
                  : AdjectivesEkavian.bel,
              grammarType: GrammarTypes.adjective,
              correctValues: !isSerbian
                  ? AdjectivesIjekavian.bijel.akuzativ!.feminine!.plural
                  : AdjectivesEkavian.bel.akuzativ!.feminine!.plural,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.macka.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.macka,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.macka.akuzativ.plural,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.jezero.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Vidio_sam_lijepa_jezera_u_Crnoj_Gori'),
          sentenceParts: [
            CaseSentencePart(
                displayValue: isCroatian ? 'Vidio sam' : 'Video sam'),
            CaseSentencePart(
              displayValue: !isSerbian
                  ? AdjectivesIjekavian.lijep.dictionary
                  : AdjectivesEkavian.lep.dictionary,
              isCorrectable: true,
              actualObject: !isSerbian
                  ? AdjectivesIjekavian.lijep
                  : AdjectivesEkavian.lep,
              grammarType: GrammarTypes.adjective,
              correctValues: !isSerbian
                  ? AdjectivesIjekavian.lijep.akuzativ!.feminine!.plural
                  : AdjectivesEkavian.lep.akuzativ!.feminine!.plural,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.jezero.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.jezero,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.jezero.akuzativ.plural,
            ),
            CaseSentencePart(displayValue: 'u Crnoj Gori')
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.poklon.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Za_vas_smo_odabrali_najbolje_poklone'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Za vas smo odabrali'),
            CaseSentencePart(
              displayValue: AdjectiveBankGeneral.najbolji.dictionary,
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.najbolji,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.najbolji.akuzativ!.masculine.plural,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.poklon.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.poklon,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.poklon.akuzativ.plural,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: isSerbian
              ? NounsEkavian.covek.gender
              : NounsIjekavian.covjek.gender,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Znate_li_tog_ljubaznog_covjeka'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Znate li'),
            CaseSentencePart(
              displayValue: DemonstrativePronouns.taj.dictionary,
              isCorrectable: true,
              actualObject: DemonstrativePronouns.taj,
              grammarType: GrammarTypes.possessivePronoun,
              correctValues:
                  DemonstrativePronouns.taj.akuzativ!.masculine.singular,
            ),
            CaseSentencePart(
              displayValue: AdjectiveBankGeneral.ljubazan.dictionary,
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.ljubazan,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.ljubazan.akuzativ!.masculine.singular,
            ),
            CaseSentencePart(
              displayValue: isSerbian
                  ? NounsEkavian.covek.dictionary
                  : NounsIjekavian.covjek.dictionary,
              isCorrectable: true,
              actualObject:
                  isSerbian ? NounsEkavian.covek : NounsIjekavian.covjek,
              grammarType: GrammarTypes.noun,
              correctValues: isSerbian
                  ? NounsEkavian.covek.akuzativ.singular
                  : NounsIjekavian.covjek.akuzativ.singular,
            ),
            CaseSentencePart(displayValue: '?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.slon.gender,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Volim_hraniti_ove_azijske_slonove'),
          sentenceParts: [
            CaseSentencePart(
                displayValue:
                    isSerbian ? 'Volim da nahranili' : 'Volim hraniti'),
            CaseSentencePart(
              displayValue: PossessivePronounBank.svoj.dictionary,
              isCorrectable: true,
              actualObject: PossessivePronounBank.svoj,
              grammarType: GrammarTypes.possessivePronoun,
              correctValues:
                  PossessivePronounBank.svoj.akuzativ!.masculine.plural,
            ),
            CaseSentencePart(
              displayValue: AdjectiveBankGeneral.azijski.dictionary,
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.azijski,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.azijski.akuzativ!.masculine.plural,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.slon.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.slon,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.slon.akuzativ.plural,
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
          translation: N.t('ex_Pogledaj_me_dobro'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Pogledaj'),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.ja.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ja,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.ja.akuzativ.forms,
            ),
            CaseSentencePart(displayValue: 'dobro'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Volim_te_jako_puno'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Volim'),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.ti.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ti,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.ti.akuzativ.forms,
            ),
            CaseSentencePart(displayValue: 'jako puno'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Masculine,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Poznajete_li_ga'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Poznajete li'),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.on.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.on,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.on.akuzativ.forms,
            ),
            CaseSentencePart(displayValue: '?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Jesi_li_je_vidio_jucer'),
          extraInfo: N.t('extrainfo_all_ona_aku_ok'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Jesi li'),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.ona.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ona,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.ona.akuzativ.forms,
            ),
            CaseSentencePart(displayValue: isCroatian ? 'vidio' : 'video'),
            CaseSentencePart(displayValue: 'jučer?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Vidio_ju_je'),
          extraInfo: N.t('extrainfo_ona_aku_je_not_ok'),
          sentenceParts: [
            CaseSentencePart(displayValue: isCroatian ? 'Vidio' : 'Video'),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.ona.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.ona,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: ['nju', 'ju'],
            ),
            CaseSentencePart(displayValue: 'je?'),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Ne_gledaj_nas'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ne gledaj'),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.mi.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.mi,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.mi.akuzativ.forms,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Unspecific,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Ne_cujem'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ne čujem '),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.vi.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.vi,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.vi.akuzativ.forms,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: Genders.Masculine,
          isPlural: true,
          isAnimate: true,
          translation: N.t('ex_Zelim_ih_kupiti'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Želim'),
            CaseSentencePart(
              displayValue: PersonalPronounWordBank.oni.dictionary,
              isCorrectable: true,
              actualObject: PersonalPronounWordBank.oni,
              grammarType: GrammarTypes.personalPronoun,
              correctValues: PersonalPronounWordBank.oni.akuzativ.forms,
            ),
            CaseSentencePart(displayValue: 'kupiti'),
          ],
        ),
        PANCombo(
            caseType: caseType,
            gender: Genders.Unspecific,
            isPlural: true,
            isAnimate: true,
            extraInfo: N.t('extrainfo_akuzativ_with_za'),
            sentenceParts: [
              CaseSentencePart(displayValue: 'Koja je vrsta kreveta prava za'),
              CaseSentencePart(
                  isCorrectable: true,
                  actualObject: PersonalPronounWordBank.vi,
                  displayValue: '',
                  correctValues: PersonalPronounWordBank.vi.akuzativ.forms,
                  grammarType: GrammarTypes.personalPronoun),
              CaseSentencePart(displayValue: '?')
            ],
            translation: N.t('ex_Koja_je_vrsta_kreveta_prava_za_vas'))
      ];

  List<PANCombo> get premium => [
        // Irregulars
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.bolest.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Dobio_sam_bolest'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Dobio sam'),
            CaseSentencePart(
              displayValue: NounBankGeneral.bolest.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.bolest,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.bolest.akuzativ.singular,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounsIjekavian.covjek.gender,
          isPlural: false,
          isAnimate: true,
          translation: N.t('ex_Primijetio_sam_visokog_covjeka'),
          extraInfo: N.t('extrainfo_akusativ_for_male_animate'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Primijetio sam'),
            CaseSentencePart(
              displayValue: AdjectiveBankGeneral.velik.dictionary,
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.velik,
              grammarType: GrammarTypes.adjective,
              correctValues:
                  AdjectiveBankGeneral.velik.genitiv!.masculine.singular,
            ),
            CaseSentencePart(
              displayValue: !isSerbian
                  ? NounsIjekavian.covjek.dictionary
                  : NounsEkavian.covek.dictionary,
              isCorrectable: true,
              actualObject:
                  !isSerbian ? NounsIjekavian.covjek : NounsEkavian.covek,
              grammarType: GrammarTypes.noun,
              correctValues: !isSerbian
                  ? NounsIjekavian.covjek.akuzativ.singular
                  : NounsEkavian.covek.akuzativ.singular,
            ),
          ],
        ),
      ];
}
