import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class DativExercises {
  late bool isCroatian;
  final Cases caseType = Cases.Dat;

  DativExercises(DialectType dialect) {
    this.isCroatian = dialect == DialectType.Croatia;
  }

  List<PANCombo> get general => [
        // TODO: Koji and adjective exerc
        PANCombo(
            caseType: caseType,
            gender: Genders.Unspecific,
            isPlural: true,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Nema na'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject:
                    isCroatian ? NounsIjekavian.sto : NounsEkavian.sta,
                displayValue: isCroatian
                    ? NounsIjekavian.sto.dictionary
                    : NounsEkavian.sta.dictionary,
                correctValues: isCroatian
                    ? NounsIjekavian.sto.dativ!.singular
                    : NounsEkavian.sta.dativ!.singular,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Nema_na_cemu')),
        PANCombo(
            caseType: caseType,
            gender: NounBankGeneral.majka.gender,
            isPlural: false,
            sentenceParts: [
              CaseSentencePart(displayValue: 'Poslao sam dugo pismo'),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: PossessivePronounBank.svoj,
                displayValue: PossessivePronounBank.svoj.dictionary,
                correctValues:
                    PossessivePronounBank.svoj.dativ!.feminine!.singular,
                grammarType: GrammarTypes.possessivePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                actualObject: NounBankGeneral.majka,
                displayValue: NounBankGeneral.majka.dictionary,
                correctValues: NounBankGeneral.majka.dativ!.singular,
                grammarType: GrammarTypes.noun,
              ),
            ],
            isAnimate: false,
            translation: N.t('ex_Poslao_sam_dugo_pismo_svojoj_majci')),
      ];

  List<PANCombo> get personalPronouns => [];

  List<PANCombo> get premium => [];
}
