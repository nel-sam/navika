import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

StaticSentenceParts getStaticSentenceParts(
  Noun noun,
  bool isPlural,
  Adjective? pronoun,
) {
  String start = '';
  String end = '';

  if (noun.tags.contains(Tags.Location)) {
    start = 'Idemo u';
  } else if (noun.tags.contains(Tags.Food)) {
    start = N.coinFlip() ? 'Ću jesti' : 'Želi';
  } else if (pronoun != null && pronoun.nominativ.masculine.singular != 'moj')
    start = N.coinFlip() ? 'Ja vidim' : 'Volim';
  else if (noun.tags.contains(Tags.Portable)) {
    start = 'Daj mi';
  } else {
    start = 'Vidimo';
  }

  return StaticSentenceParts(start: start, end: end);
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
  PersonalPronoun personalPronoun,
  bool isShortForm,
) {
  final actualValue = isShortForm
      ? personalPronoun.nominativ.shortForm
      : personalPronoun.nominativ.general;
  String start = '';
  String end = '';

  if (actualValue != 'mi' && N.coinFlip()) {
    start = 'Mi vidimo';
  } else if (actualValue != 'ti' && N.coinFlip()) {
    start = 'Daj to ';
  } else if (isShortForm) {
    start = 'Molim';
  } else {
    start = actualValue != 'ti' ? 'Videš' : 'Videm';
  }

  return StaticSentenceParts(start: start, end: end);
}

class Akuzativ extends StatefulWidget {
  @override
  _AkuzativState createState() => _AkuzativState();
}

class _AkuzativState extends State<Akuzativ> {
  final title = 'Akuzativ';
  final WordBank bank = wordBank;
  var filterSet = ExerciseFilterSet();

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Akuzativ,
      sourceData: bank,
      getStaticSentenceParts: getStaticSentenceParts,
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Akuzativ]!,
        caseName: title,
        description: AppLocalizations.of(context)!.akuzativDescription,
        icons: [
          Icons.remove_red_eye_outlined,
          Icons.car_rental,
          Icons.arrow_forward,
          Icons.euro,
        ],
      ),
      onFilterSet: (ExerciseFilterSet newFilterSet) => setState(() {
        filterSet = newFilterSet;
      }),
      filterSet: filterSet,
    );
  }
}
