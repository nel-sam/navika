import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/case-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';

StaticSentenceParts getStaticSentenceParts(
  Noun noun,
  bool isPlural,
  Adjective? pronoun,
  Adjective? adjective,
) {
  final pronounVal = pronoun!.dictionary;
  String start = '';
  String end = '';

  if (noun.tags.contains(Tags.FlatSurface)) {
    start = N.coinFlip() ? 'Spavam u' : 'Jabuka je na';
  } else if (noun.tags.contains(Tags.WorkPlace)) {
    start = pronounVal == 'moj' ? 'On rade u' : 'Radim u';
  } else if (noun.tags.contains(Tags.Location)) {
    start = pronounVal == 'moj' ? 'On živi u' : 'Živim u';
  } else {
    start = 'Razgovoramo o';
  }

  return StaticSentenceParts(start: start, end: end);
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun, bool isShortForm) {
  final actualValue = personalPronoun.nominativ.forms.first;
  String start = '';
  String end = '';

  if (N.coinFlip()) {
    start = actualValue != 'ja' ? 'Sanjam o' : 'On je kod';
  } else {
    start = 'Razgovoramo o';
  }

  return StaticSentenceParts(start: start, end: end);
}

class Lokativ extends StatefulWidget {
  @override
  _LokativState createState() => _LokativState();
}

class _LokativState extends State<Lokativ> {
  final title = 'Lokativ';
  final WordBank bank = wordBank;
  var settingsSet = SettingsSet();

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
      onSettingsSet: (SettingsSet newSettingsSet) => setState(() {
        settingsSet = newSettingsSet;
      }),
      settingsSet: settingsSet,
    );
  }
}
