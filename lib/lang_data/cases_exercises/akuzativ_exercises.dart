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
          isAnimate: false,
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
      ];

  List<PANCombo> get premium => [];
}
