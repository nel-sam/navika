import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative-pronouns.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class GenitivExercises {
  late bool isCroatian;
  final Cases caseType = Cases.Gen;

  GenitivExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
  }

  List<PANCombo> get level1 => [
        PANCombo(
          caseType: caseType,
          gender: Genders.Feminine,
          isPlural: false,
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
              displayValue: '',
              correctValues:
                  AdjectiveBankGeneral.sladak.genitiv!.feminine!.singular,
              grammarType: GrammarTypes.adjective,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.torta,
              displayValue: '',
              correctValues: NounBankGeneral.torta.genitiv.singular,
              grammarType: GrammarTypes.noun,
            ),
          ],
          isAnimate: false,
          translation: N.t('ex_Mogu_li_dobiti_malo_te_slatke_torte'),
        )
      ];

  List<PANCombo> get level2 => [];

  List<PANCombo> get personalPronouns => [];

  List<PANCombo> get premium => [];
}
