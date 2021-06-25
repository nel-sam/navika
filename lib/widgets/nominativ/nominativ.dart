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
    Noun noun, bool isPlural, Adjective pronoun) {
  final tense = N.getRandomTense();
  String start = '';
  String end = '';

  if (noun.isAnimate && isPlural) {
    if (tense == TenseEnum.Past || tense == TenseEnum.Conditional) {
      start = noun.gender == Genders.Feminine ? 'One su bile' : 'Oni su bili';
    } else {
      start = noun.gender == Genders.Feminine ? 'One su' : 'Oni su';
    }
  } else if (!noun.isAnimate && isPlural) {
    if (tense == TenseEnum.Future || tense == TenseEnum.Conditional)
      start = isPlural ? 'One će biti' : 'To će biti';
    else {
      start = 'To su';
    }
  } else if (noun.isAnimate && !isPlural) {
    if (tense == TenseEnum.Past || tense == TenseEnum.Conditional) {
      start = noun.gender == Genders.Feminine ? 'Ona će biti' : 'On će biti';
    } else {
      start = noun.gender == Genders.Feminine ? 'Ona je' : 'On su';
    }
  } else if (!noun.isAnimate && !isPlural) {
    if (tense == TenseEnum.Past || tense == TenseEnum.Conditional) {
      if (noun.gender == Genders.Feminine) {
        start = 'To je bila';
      } else if (noun.gender == Genders.Masculine)
        start = 'To je bio';
      else
        start = 'To je bilo';
    }
  }

  if (start == '' && end == '') {
    start = 'To je';
  }

  return StaticSentenceParts(start: start, end: end);
}

StaticSentenceParts getPersonalPronounSentenceStaticParts(
    PersonalPronoun personalPronoun, bool isShortForm) {
  String start = '';
  String end = '';

  final verb = N.getBitiConjugationForPronoun(isShortForm
      ? personalPronoun.nominativ.shortForm
      : personalPronoun.nominativ.general);

  if (N.coinFlip()) {
    start = 'To ' + verb;
  } else {
    var ocupation = personalPronoun.gender == Genders.Feminine
        ? (personalPronoun.isPlural ? 'učiteljice' : 'učiteljica')
        : (personalPronoun.isPlural ? 'učitelji' : 'učitelj');
    end = '$verb $ocupation';
  }

  return StaticSentenceParts(start: start, end: end);
}

class Nominativ extends StatefulWidget {
  @override
  _NominativState createState() => _NominativState();
}

class _NominativState extends State<Nominativ> {
  final title = 'Nominativ';
  final WordBank bank = wordBank.excludePronoun('svoj');
  var filterSet = ExerciseFilterSet();

  @override
  Widget build(BuildContext context) {
    return CaseExercise(
      title: title,
      caseType: CaseTypeEnum.Nominativ,
      sourceData: bank,
      getStaticSentenceParts: getStaticSentenceParts,
      getPersonalPronounSentenceStaticParts:
          getPersonalPronounSentenceStaticParts,
      banner: NavikaBanner(
        imagePath: CaseImagePaths[CaseTypeEnum.Nominativ]!,
        caseName: title,
        description: AppLocalizations.of(context)!.nominativDescription,
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
