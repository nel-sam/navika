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

  // TODO: The help guide needs modification or a new one for this exercise type
  List<PANCombo> get general => [
        PANCombo(
          gender: NounBankGeneral.godina.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Moj_sin_ima_jednu_godinu'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Moj sin ima'),
            CaseSentencePart(
              isCorrectable: true,
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
          translation: N.t('ex_Njegov_pas_ima_dve_godine'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Njegov pas ima'),
            CaseSentencePart(
              isCorrectable: true,
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
          isPlural: true,
          isAnimate: false,
          translation: N.t('ex_Kad_sam_imao_tri_godine_otisli_smo_u_Italiju'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Kad sam imao'),
            CaseSentencePart(
              isCorrectable: true,
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
          sentenceParts: [
            CaseSentencePart(displayValue: 'Živim ovdje već'),
            CaseSentencePart(
              isCorrectable: true,
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
          sentenceParts: [
            CaseSentencePart(displayValue: 'Za'),
            CaseSentencePart(
              isCorrectable: true,
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
      ];
}
