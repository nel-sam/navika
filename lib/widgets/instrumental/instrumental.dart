import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/footer.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';

StaticSentenceParts getStaticSentenceParts(
    Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';

  start = 'Idem sa';
  return StaticSentenceParts(start: start, end: '');
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun, bool isShortForm) {
  return StaticSentenceParts(start: 'TEST', end: 'TEST');
}

class Instrumental extends StatelessWidget {
  final title = 'Instrumental';

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Instrumental,
      sourceData: wordBank,
      getStaticSentenceParts: getStaticSentenceParts,
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Instrumental]!,
        caseName: title,
        description: AppLocalizations.of(context)!.instrumentalDescription,
        icons: [
          Icons.handyman_outlined,
          Icons.train,
          Icons.motorcycle,
        ],
      ),
    );
  }
}
