import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class VokativExercises {
  late bool isCroatian;
  late bool isSerbian;
  final Cases caseType = Cases.Vok;

  VokativExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
    this.isSerbian = dialect == DialectType.Serbia;
  }

  List<PANCombo> get general => [
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.prijatelj.gender,
          isPlural: false,
          extraInfo: N.t('extrainfo_adj_after_noun_in_vokative'),
          isAnimate: false,
          translation: N.t('ex_Prijatelju_moj'),
          // Prijatelju moj!
          sentenceParts: [
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.prijatelj,
              displayValue: NounBankGeneral.prijatelj.dictionary,
              correctValues: NounBankGeneral.prijatelj.vokativ.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(
              isCorrectable: false,
              actualObject: PossessivePronounBank.moj,
              displayValue: PossessivePronounBank.moj.dictionary,
              correctValues:
                  PossessivePronounBank.moj.vokativ!.masculine.singular,
              grammarType: GrammarTypes.adjective,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.gospodin.gender,
          isPlural: false,
          extraInfo: N.t('extrainfo_gospodin_is_very_irregular'),
          isAnimate: false,
          translation: N.t('ex_Hvala_Vam_gospodine'),
          // Hvala Vam, gospodine!
          sentenceParts: [
            CaseSentencePart(displayValue: 'Hvala Vam,'),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.gospodin,
              displayValue: NounBankGeneral.gospodin.dictionary,
              correctValues: NounBankGeneral.gospodin.vokativ.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
        ),
        PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.karolina.gender,
          isPlural: false,
          isAnimate: false,
          translation: N.t('ex_Karolina_budi_oprezna'),
          // Karolina, budi oprezna!
          sentenceParts: [
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.karolina,
              displayValue: NounBankGeneral.karolina.dictionary,
              correctValues: NounBankGeneral.karolina.vokativ.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: ', budi oprezna!'),
          ],
        ),
      ];
}
