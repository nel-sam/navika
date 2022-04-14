import 'package:navika/lang_data/adjectives.dart';
import 'package:navika/lang_data/ekavian/nouns_ekavian.dart';
import 'package:navika/lang_data/ijekavian/nouns_ijekavian.dart';
import 'package:navika/lang_data/nouns.dart';
import 'package:navika/lang_data/personal-pronouns.dart';
import 'package:navika/lang_data/possessive-pronouns.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class SentenceBankGenerator {
  late SentenceBank _sentenceBank;

  SentenceBankGenerator({required DialectType dialect}) {
    if (dialect == DialectType.Ekavian) {
      _sentenceBank = SentenceBank(
        adjectives: adjectiveWordBank,
        nouns: [...nounBankGeneral, ...nounsEkavian],
        possessivePronouns: possessivePronounWordBank,
        personalPronouns: personalPronounWordBank,
      );
    } else {
      _sentenceBank = SentenceBank(
        adjectives: adjectiveWordBank,
        nouns: [...nounBankGeneral, ...nounsIjekavian],
        possessivePronouns: possessivePronounWordBank,
        personalPronouns: personalPronounWordBank,
      );
    }
  }

  SentenceBank get sentences {
    return _sentenceBank;
  }
}
