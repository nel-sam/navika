import 'package:navika/lang_data/words/adjectives.dart';
import 'package:navika/lang_data/words/ekavian/adjectives_ekavian.dart';
import 'package:navika/lang_data/words/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/words/ijekavian/adjectives_ijekavian.dart';
import 'package:navika/lang_data/words/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/lang_data/words/personal-pronouns.dart';
import 'package:navika/lang_data/words/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class SentenceBankGenerator {
  late SentenceBank _sentenceBank;

  SentenceBankGenerator({required DialectType dialect}) {
    if (dialect == DialectType.Ekavian) {
      _sentenceBank = SentenceBank(
        adjectives: [...adjectiveBankGeneral, ...adjectivesEkavian],
        nouns: [...nounBankGeneral, ...nounsEkavian],
        possessivePronouns: possessivePronounWordBank,
        personalPronouns: personalPronounWordBank,
      );
    } else {
      _sentenceBank = SentenceBank(
        adjectives: [...adjectiveBankGeneral, ...adjectivesIjekavian],
        nouns: [...nounBankGeneral, ...nounsIjekavian],
        possessivePronouns: possessivePronounWordBank,
        personalPronouns: personalPronounWordBank,
      );
    }
  }

  SentenceBank get sentencesBankData {
    return _sentenceBank;
  }
}
