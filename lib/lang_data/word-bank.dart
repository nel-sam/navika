import 'package:navika/lang_data/personal-pronouns.dart';
import 'package:navika/lang_data/possesive-pronouns.dart';
import 'package:navika/lang_data/adjectives.dart';
import 'package:navika/lang_data/nouns.dart';
import 'package:navika/models/models.dart';

final WordBank wordBank = WordBank(
  adjectives: adjectiveWordBank,
  nouns: nounWordBank,
  possesivePronouns: possesivePronounWordBank,
  personalPronouns: personalPronounWordBank,
);
