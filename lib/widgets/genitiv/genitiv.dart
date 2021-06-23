import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';

StaticSentenceParts getStaticSentenceParts(
  Noun noun,
  bool isPlural,
  Adjective? pronoun,
) {
  String start = '';
  String end = '';

  if (noun.tags.contains(Tags.BodyPart) && !isPlural) {
    start = 'Boja';
    end = 'je lijepa';
  } else if (noun.tags.contains(Tags.Human) ||
      noun.tags.contains(Tags.Portable)) {
    if (pronoun!.dictionary != 'moj')
      start = N.coinFlip() ? 'Otkad sam bez' : 'Ići ću bez';
    else
      start = 'Ići ćeš bez';
  } else if (noun.tags.contains(Tags.Location)) {
    start = pronoun!.dictionary != 'moj' ? 'Ja sam iz' : 'On je iz';
  } else if (N.coinFlip()) {
    start = 'Volim boja';
  } else {
    start = 'Nema';
  }

  return StaticSentenceParts(start: start, end: end);
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun, bool isShortForm) {
  String start = '';
  String end = '';
  final actualValue = isShortForm
      ? personalPronoun.nominativ.shortForm
      : personalPronoun.nominativ.general;

  if (actualValue != 'on') {
    start = N.coinFlip() ? 'Nisam spavala zbog' : 'On pleše';
  } else if (actualValue != 'oni') {
    start = N.coinFlip() ? 'Oni su išli bez' : 'Ne možeš spavati zbog';
  } else if (actualValue != 'ja') {
    start = N.coinFlip() ? 'Ne mogu spavati zbog' : 'Stojim iza';
  } else {
    start = 'Stanite iza';
    end = ', molim vas';
  }

  return StaticSentenceParts(start: start, end: end);
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
