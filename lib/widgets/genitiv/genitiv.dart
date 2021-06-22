import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';

StaticSentenceParts getStaticSentenceParts(
    Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';
  if (isPlural) {
    start = 'To su';
  } else {
    start = 'To je';
  }

  return StaticSentenceParts(start: start, end: '');
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun, bool isShortForm) {
  return StaticSentenceParts(start: 'TEST', end: 'TEST');
}

class Genitiv extends StatefulWidget {
  @override
  _GenitivState createState() => _GenitivState();
}

class _GenitivState extends State<Genitiv> {
  final title = 'Genitiv';
  final WordBank bank = wordBank;
  var filterSet = ExerciseFilterSet();

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Genitiv,
      sourceData: bank,
      getStaticSentenceParts: getStaticSentenceParts,
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Genitiv]!,
        caseName: title,
        description: AppLocalizations.of(context)!.genitiveDescription,
        icons: [
          Icons.category_outlined,
          Icons.nature,
          Icons.people,
        ],
      ),
      onFilterSet: (ExerciseFilterSet newFilterSet) => setState(() {
        filterSet = newFilterSet;
      }),
      filterSet: filterSet,
    );
  }
}
