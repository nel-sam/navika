import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class GenitivExercises {
  late bool isCroatian;
  final Cases caseType = Cases.All;

  GenitivExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
  }

  List<PANCombo> get level1 => [
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.krevet.gender,
            isPlural: false,
            sentenceParts: [
              CaseSentencePart(
                  displayValue:
                      'Koja je vrsta'), // TODO: Koja/vrsta as correctable?
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.krevet,
                displayValue: '',
                correctValues: NounBankGeneral.krevet.genitiv.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(
                  displayValue: 'prava za'), // TODO: Prava as correctable?

              CaseSentencePart(
                  isCorrectable: true,
                  actualObject: PersonalPronounWordBank.vi,
                  displayValue: '',
                  correctValues: PersonalPronounWordBank.vi.akuzativ.forms,
                  grammarType: GrammarTypes.personalPronoun),
              CaseSentencePart(displayValue: '?')
            ],
            isAnimate: false,
            translation: N.t('ex_Koja_je_vrsta_kreveta_prava_za_vas')),
      ];
}
