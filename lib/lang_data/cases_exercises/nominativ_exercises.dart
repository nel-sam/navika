import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/demonstrative-pronouns.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

class NominativExercises {
  late bool isSerbian;
  final Cases caseType = Cases.Nom;

  NominativExercises(DialectType dialect) {
    this.isSerbian = dialect == DialectType.Ekavian;
  }

  List<PANCombo> get level1 => [
        PANCombo(
            caseType: caseType,
            //adjective: AdjectiveBankGeneral.star,
            //noun: isSerbian ? NounsEkavian.avion : NounsIjekavian.zrakoplov,
            gender: Genders.Masculine,
            isPlural: false,
            getTrans: (context) => N.t('ex_toJeStariAvionKojiImaDvaKrila'),
            sentenceParts: [
              CaseSentencePart(
                isCorrectable: true,
                displayValue: DemonstrativePronouns.taj.dictionary,
                correctValues:
                    DemonstrativePronouns.taj.nominativ!.masculine.singular,
                grammarType: GrammarTypes.demonstrativePronoun,
              ),
              CaseSentencePart(
                isCorrectable: true,
                displayValue: '',
                correctValues: AdjectiveBankGeneral.star
                    .getDeclensions(Genders.Masculine, false, Cases.Nom, false),
                grammarType: GrammarTypes.adjective,
              ),
              CaseSentencePart(
                isCorrectable: true,
                displayValue: '',
                correctValues: isSerbian
                    ? NounsEkavian.avion.getDeclensions(false, Cases.Nom)
                    : NounsIjekavian.zrakoplov.getDeclensions(false, Cases.Nom),
                grammarType: GrammarTypes.noun,
              ),
              CaseSentencePart(displayValue: 'ima dva krila'),
            ]),
      ];

  List<PANCombo> get level2 => [];

  List<PANCombo> get premium => [];
}
