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

// TODO: Figure out how to handle sa/s
StaticSentenceParts getStaticSentenceParts(
  Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';
  String end = '';
  String possPronoun = pronoun!.nominativ.masculine.singular;

  if (noun.tags.contains(Tags.Human) || noun.tags.contains(Tags.Portable)) {
    if (possPronoun != 'tvoj')
      start = N.coinFlip() ? 'Ti ideš s' : 'Trebaš da ideš s';
    else
      start = 'Idemo s';
  } else if (noun.tags.contains(Tags.Vehicle)) {
    start = possPronoun == 'moj' ? 'Putujemo' : 'Putujem';
  } else if (noun.tags.contains(Tags.Location)) {
    start = '';
  } else if (possPronoun == 'moj')
    start = 'Ideš s';
  else
    start = 'Idem s';

  return StaticSentenceParts(start: start, end: end);
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun, bool isShortForm) {
  String start = '';
  String end = '';

  return StaticSentenceParts(start: start, end: end);
}

class Instrumental extends StatefulWidget {
  @override
  _InstrumentalState createState() => _InstrumentalState();
}

class _InstrumentalState extends State<Instrumental> {
  final title = 'Instrumental';
  final WordBank bank = wordBank.excludeNounsByTag(Tags.Location);
  var filterSet = ExerciseFilterSet();

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Instrumental,
      sourceData: bank,
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
      onFilterSet: (ExerciseFilterSet newFilterSet) => setState(() {
        filterSet = newFilterSet;
      }),
      filterSet: filterSet,
    );
  }
}
