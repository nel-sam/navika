import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class AkuzativExercises {
  late bool isCroatian;
  final Cases caseType = Cases.Aku;

  AkuzativExercises(DialectType dialect) {
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
                      'Koja je vrsta krevet prava za'), // TODO: Koja/vrsta as correctable?
              CaseSentencePart(
                  isCorrectable: true,
                  actualObject: PersonalPronounWordBank.vi,
                  displayValue: '',
                  correctValues: PersonalPronounWordBank.vi.akuzativ.forms,
                  grammarType: GrammarTypes.personalPronoun),
              CaseSentencePart(displayValue: '?')
            ],
            isAnimate: false,
            translation: N.t('ex_Koja_je_vrsta_kreveta_prava_za_vas'))
      ];

  List<PANCombo> get personalPronouns => [];

  List<PANCombo> get premium => [];
}
