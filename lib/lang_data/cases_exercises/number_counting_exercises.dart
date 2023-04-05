import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/numbers.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class NumberCountingExercises {
  NumberCountingExercises();

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
              displayValue: CardinalNumbersBank.jedan.dictionary,
              correctValues:
                  CardinalNumbersBank.jedan.akuzativ!.feminine!.singular,
              grammarType: GrammarTypes.adjective,
              caseType: Cases.Aku,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.godina,
              displayValue: NounBankGeneral.godina.dictionary,
              correctValues: NounBankGeneral.godina.akuzativ.singular,
              grammarType: GrammarTypes.noun,
              caseType: Cases.Aku,
            ),
          ],
        ),
      ];
}
