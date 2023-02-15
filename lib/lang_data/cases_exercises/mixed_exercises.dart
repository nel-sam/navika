import 'package:navika/lang_data/words/adjectives.dart';
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

  List<PANCombo> get general => [
    PANCombo(
          caseType: caseType,
          gender: NounBankGeneral.pas.gender,
          isPlural: false,
          isAnimate: true,
          extraInfo:  N.t('extrainfo_akusativ_for_male_animate'),
          translation: N.t('ex_Udomila_sam_starog_psa_sa_ceste'),
          sentenceParts: [
            CaseSentencePart(displayValue: 'Udomila sam'),
            CaseSentencePart(
              displayValue: AdjectiveBankGeneral.star.dictionary,
              isCorrectable: true,
              actualObject: AdjectiveBankGeneral.star,
              grammarType: GrammarTypes.adjective,
              correctValues: AdjectiveBankGeneral.star.genitiv!.masculine.singular,
            ),
            CaseSentencePart(
              displayValue: NounBankGeneral.pas.dictionary,
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              grammarType: GrammarTypes.noun,
              correctValues: NounBankGeneral.pas.genitiv.singular,
            ),
            CaseSentencePart(displayValue: 'sa ceste'),
          ],
        ),
        PANCombo(
            caseType: caseType,
            gender: Genders.Unspecific,
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
        PANCombo(
            caseType: caseType,
            gender: Genders.Unspecific,
            isPlural: true,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Prije 16'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.godina,
                displayValue: NounBankGeneral.godina.dictionary,
                correctValues: NounBankGeneral.godina.genitiv.plural,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'udomio sam'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.pas,
                displayValue: NounBankGeneral.pas.dictionary,
                correctValues: NounBankGeneral.pas.akuzativ.plural,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'sa ceste'),
            ],
            isAnimate: false,
            translation: N.t('ex_Prije_16_godina_udomio_sam_pse_sa_ceste')),
        PANCombo(
            caseType: caseType,
            gender: Genders.Unspecific,
            isPlural: true,
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.otac,
                displayValue: NounBankGeneral.otac.dictionary,
                correctValues: NounBankGeneral.otac.nominativ.singular,
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'je polako otišao od'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.kuca,
                displayValue: NounBankGeneral.kuca.dictionary,
                correctValues: NounBankGeneral.kuca.genitiv.singular,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Otac_je_polako_otisao_od_kuce')),
      ];
}
