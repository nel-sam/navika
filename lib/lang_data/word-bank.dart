import 'package:navika/lang_data/possesive-pronouns.dart';
import 'package:navika/lang_data/adjective.dart';
import 'package:navika/lang_data/noun.dart';
import 'package:navika/models/models.dart';

final WordBank wordBank = WordBank(
  adjectives: adjectiveWordBank,
  nouns: nounWordBank,
  possesivePronouns: possesivePronounWordBank,
);
