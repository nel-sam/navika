import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

StaticSentenceParts getStaticSentenceParts(
  Noun noun,
  bool isPlural,
  Adjective? pronoun,
) {
  String start = '';
  String end = '';

  if (noun.isAnimate) {
    start = 'Daj to ';
  } else if (isPlural) {
    start = 'Slični su ';
  } else {
    start = 'Slično je ';
  }

  return StaticSentenceParts(start: start, end: end);
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
  PersonalPronoun personalPronoun,
  bool isShortForm,
) {
  String start = '';
  String end = '';

  if (N.coinFlip()) {
    start = 'Došlo je do';
  } else if (N.coinFlip()) {
    start = 'Odakle';
    end = 'to dolazi';
  } else if (N.coinFlip()) {
    start = 'Pas';
    end = 'je donio igračku';
  } else {
    start = 'On';
    end = 'nešto pokazao';
  }
  print(start +
      ' ' +
      (isShortForm
          ? personalPronoun.dativ.shortForm
          : personalPronoun.dativ.general) +
      ' ' +
      end);
  return StaticSentenceParts(start: start, end: end);
}

class Akuzativ extends StatelessWidget {
  final title = 'Dativ';

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Dativ,
      sourceData: wordBank,
      getStaticSentenceParts: getStaticSentenceParts,
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Dativ]!,
        caseName: title,
        description: AppLocalizations.of(context)!.dativDescription,
        icons: [
          Icons.person,
          Icons.arrow_forward,
          Icons.people,
        ],
      ),
    );
  }
}
