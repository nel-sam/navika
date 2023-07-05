import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/numbers.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class NumberCountingExercises {
  final DialectType dialect;
  late bool isSerbian;

  NumberCountingExercises({required this.dialect}) {
    this.isSerbian = dialect == DialectType.Serbia;
  }

  // TODO: Add extraninfos

  List<PANCombo> get ages => [
        PANCombo(
          gender: NounBankGeneral.godina.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Njegov_pas_ima_dve_godine'),
          // Njegov pas ima dvije/dve godine
          sentenceParts: [
            CaseSentencePart(displayValue: 'Njegov pas ima'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.dva,
              displayValue: '',
              correctValues: [isSerbian ? 'dve' : 'dvije'],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: '',
              correctValues: NounBankGeneral.godina.akuzativ.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Aku,
            ),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.godina.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Moj_sin_ima_jednu_godinu'),
          // Moj sin ima jednu godinu
          sentenceParts: [
            CaseSentencePart(displayValue: 'Moj sin ima'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.jedan,
              displayValue: '',
              correctValues:
                  CardinalNumbersBank.jedan.akuzativ!.feminine!.singular,
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: '',
              correctValues: NounBankGeneral.godina.akuzativ.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Aku,
            ),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.godina.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Kad_sam_imao_tri_godine_otisli_smo_u_Italiju'),
          // Kad sam imao tri godine otišli smo u Italiju
          sentenceParts: [
            CaseSentencePart(displayValue: 'Kad sam imao'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.tri,
              displayValue: '',
              correctValues: [CardinalNumbersBank.tri.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: '',
              correctValues: NounBankGeneral.godina.akuzativ.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(displayValue: 'otišli smo u Italiju'),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.godina.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Zivim_ovdje_vec_cetiri_godine'),
          // Živim ovdje već četiri godine
          sentenceParts: [
            CaseSentencePart(displayValue: 'Živim ovdje već'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.cetiri,
              displayValue: '',
              correctValues: [CardinalNumbersBank.cetiri.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: '',
              correctValues: NounBankGeneral.godina.akuzativ.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Aku,
            ),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.godina.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Za_pet_godina_cu_se_ozeniti'),
          // Za pet godina ću se oženiti
          sentenceParts: [
            CaseSentencePart(displayValue: 'Za'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.pet,
              displayValue: '',
              correctValues: [CardinalNumbersBank.pet.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: '',
              correctValues: NounBankGeneral.godina.genitiv.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(displayValue: 'ću se oženiti'),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.godina.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Prije_16_godina_udomio_sam_pse_sa_ceste'),
          // Prije 16 godina udomio sam pse sa ceste
          sentenceParts: [
            CaseSentencePart(displayValue: isSerbian ? 'Pre' : 'Prije'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.sesnaest,
              displayValue: '',
              correctValues: [CardinalNumbersBank.sesnaest.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: '',
              correctValues: NounBankGeneral.godina.genitiv.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(displayValue: 'udomio sam pse sa ceste'),
          ],
        ),
      ];

  List<PANCombo> get countingThings => [
        // 1 item
        PANCombo(
          gender: NounBankGeneral.jezero.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Ima_jedno_jezero_tamo'),
          // Ima jedno jezero tamo
          extraInfo: N.t(
              'extrainfo_both_number_and_noun_decline_when_counting_a_single_thing'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Ima'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.jedan,
              displayValue: '',
              correctValues:
                  CardinalNumbersBank.jedan.nominativ!.neuter!.singular,
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.jezero,
              displayValue: '',
              correctValues: NounBankGeneral.jezero.akuzativ.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(displayValue: 'tamo'),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.grad.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Zagreb_je_jedni_grad_u_Hrvatskoj'),
          // Zagreb je jedini grad u Hrvatskoj
          extraInfo: N.t(
              'extrainfo_both_number_and_noun_decline_when_counting_a_single_thing'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Zagreb je'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.jedan,
              displayValue: '',
              correctValues:
                  CardinalNumbersBank.jedan.nominativ!.masculine.singular,
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.grad,
              displayValue: '',
              correctValues: NounBankGeneral.grad.nominativ.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(displayValue: 'u Hrvatskoj'),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.kuca.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Zivim_samo_u_jednoj_kuci'),
          // Živim samo u jednoj kući
          extraInfo: N.t(
              'extrainfo_both_number_and_noun_decline_when_counting_a_single_thing'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Živim samo u'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.jedan,
              displayValue: '',
              correctValues:
                  CardinalNumbersBank.jedan.lokativ!.feminine!.singular,
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.kuca,
              displayValue: '',
              correctValues: NounBankGeneral.kuca.lokativ.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Nom,
            ),
          ],
        ),
        // 2 items
        PANCombo(
          gender: NounBankGeneral.selo.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Na_slici_vidim_dva_sela'),
          // Na slici vidim dva sela
          sentenceParts: [
            CaseSentencePart(displayValue: 'Na slici vidim'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.dva,
              displayValue: '',
              correctValues: ['dva'],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.selo,
              displayValue: '',
              correctValues: NounBankGeneral.selo.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.pas.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Moj_otac_ima_dva_psa'),
          // Moj otac ima dva psa
          sentenceParts: [
            CaseSentencePart(displayValue: 'Moj otac ima'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.dva,
              displayValue: '',
              correctValues: ['dve'],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              displayValue: '',
              correctValues: NounBankGeneral.pas.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.macka.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Neki_ljudi_imaju_dvije_macke'),
          // Neki ljudi imaju dvije mačke
          sentenceParts: [
            CaseSentencePart(displayValue: 'Neki ljudi imaju'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.dva,
              displayValue: '',
              correctValues: [isSerbian ? 'dve' : 'dvije'],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.macka,
              displayValue: '',
              correctValues: NounBankGeneral.macka.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
          ],
        ),

        // 3-4
        PANCombo(
          gender: NounBankGeneral.jezero.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Dijele_se_na_tri_jezera'),
          // Dijele se na tri jezera
          sentenceParts: [
            CaseSentencePart(displayValue: 'Dijele se na'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.tri,
              displayValue: '',
              correctValues: [CardinalNumbersBank.tri.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.jezero,
              displayValue: NounBankGeneral.jezero.dictionary,
              correctValues: NounBankGeneral.jezero.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
          ],
        ),
        PANCombo(
          gender: this.isSerbian
              ? NounsEkavian.mesec.gender
              : NounsIjekavian.mjesec.gender,
          isAnimate: false,
          isPlural: true,
          translation: N.t('ex_Trebam_biti_u_Londonu_cetiri_mjeseca'),
          // Trebam biti u Londonu četiri mjeseca
          sentenceParts: [
            CaseSentencePart(displayValue: 'Trebam biti u Londonu'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.cetiri,
              displayValue: '',
              correctValues: [CardinalNumbersBank.cetiri.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject:
                  this.isSerbian ? NounsEkavian.mesec : NounsIjekavian.mjesec,
              displayValue: this.isSerbian
                  ? NounsEkavian.mesec.dictionary
                  : NounsIjekavian.mjesec.dictionary,
              correctValues: this.isSerbian
                  ? NounsEkavian.mesec.genitiv.singular
                  : NounsIjekavian.mjesec.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.zena.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Vidim_tri_zene'),
          // Vidim tri žene
          sentenceParts: [
            CaseSentencePart(displayValue: 'Vidim'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.tri,
              displayValue: '',
              correctValues: [CardinalNumbersBank.tri.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.zena,
              displayValue: NounBankGeneral.zena.dictionary,
              correctValues: NounBankGeneral.zena.genitiv.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
          ],
        ),
        // 5+
        PANCombo(
          gender: NounBankGeneral.godina.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Izmedu_njih_je_21_godina_razlike'),
          // Između njih je 21 godina razlike
          extraInfo: N.t(
              'extrainfo_nouns_for_numbers_5_and_above_decline_in_genitive_plural'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Između njih je'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.dvadesetijedan,
              displayValue: '',
              correctValues: [CardinalNumbersBank.dvadesetijedan.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: '',
              correctValues: NounBankGeneral.godina.genitiv.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(displayValue: 'razlike'),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.selo.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_od_pet_sela_koja_se_nalaze_na_obali_Italije'),
          // ...od pet sela koja se nalaze na obali Italije
          sentenceParts: [
            CaseSentencePart(displayValue: '...od'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.pet,
              displayValue: '',
              correctValues: [CardinalNumbersBank.pet.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.selo,
              displayValue: NounBankGeneral.selo.dictionary,
              correctValues: NounBankGeneral.selo.genitiv.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(displayValue: 'koja se nalaze na obali Italije')
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.razlog.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Deset_razloga_za_vožnju_biciklom'),
          // Deset razloga za vožnju biciklom
          sentenceParts: [
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.deset,
              displayValue: '',
              correctValues: [CardinalNumbersBank.deset.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.razlog,
              displayValue: NounBankGeneral.razlog.dictionary,
              correctValues: NounBankGeneral.razlog.genitiv.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(displayValue: 'za vožnju biciklom'),
          ],
        ),
        PANCombo(
          gender: NounBankGeneral.torta.gender,
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Vidio_sam_12_torti_u_pekari'),
          // Vidio sam 12 torti u pekari
          sentenceParts: [
            CaseSentencePart(displayValue: 'Vidio sam'),
            CaseSentencePart(
              isCorrectable: true,
              showTableInHelpGuide: false,
              actualObject: CardinalNumbersBank.dvanaest,
              displayValue: '',
              correctValues: [CardinalNumbersBank.dvanaest.dictionary],
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Nom,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.torta,
              displayValue: NounBankGeneral.torta.dictionary,
              correctValues: NounBankGeneral.torta.genitiv.plural,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Gen,
            ),
            CaseSentencePart(displayValue: 'u pekari'),
          ],
        ),
      ];
}
