import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';

StaticSentenceParts getStaticSentenceParts(
    Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';

  start = 'Govorim o';
  return StaticSentenceParts(start: start, end: '');
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun, bool isShortForm) {
  late String start = 'TEST';

  return StaticSentenceParts(start: start, end: '');
}

class Lokativ extends StatefulWidget {
  @override
  _LokativState createState() => _LokativState();
}

class _LokativState extends State<Lokativ> {
  final title = 'Lokativ';
  final WordBank bank = wordBank;
  var filterSet = ExerciseFilterSet();

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Lokativ,
      sourceData: bank,
      getStaticSentenceParts: getStaticSentenceParts,
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Lokativ]!,
        caseName: title,
        description: AppLocalizations.of(context)!.lokativDescription,
        icons: [
          Icons.location_on_outlined,
          Icons.message,
        ],
      ),
      onFilterSet: (ExerciseFilterSet newFilterSet) => setState(() {
        filterSet = newFilterSet;
      }),
      filterSet: filterSet,
    );
  }
}
