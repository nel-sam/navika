import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';

StaticSentenceParts getStaticSentenceStarter(
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
      start = 'To će biti';
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
  } else {
    start = 'To je';
  }

  return StaticSentenceParts(start: start, end: end);
}

StaticSentenceParts getPersonalPronounSentenceStarter(
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

// ignore: must_be_immutable
class NominativExercise extends StatefulWidget {
  @override
  _NominativExerciseState createState() => _NominativExerciseState();
}

class _NominativExerciseState extends State<NominativExercise> {
  late ScrollController controller = ScrollController();

  Widget build(BuildContext context) {
    final WordBank bank = wordBank.filterPronoun('svoj');

    var listItems = N.getPANCombos(
      bank,
      getStaticSentenceStarter,
      getPersonalPronounSentenceStarter,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text('Nominativ'),
      ),
      body: Center(
        child: ListView(
          controller: controller,
          padding: EXERCISE_LIST_PADDING,
          children: [
            NavikaBanner(
                imagePath: CaseImagePaths[CaseTypeEnum.Nominativ]!,
                caseName: 'Nominativ',
                description: AppLocalizations.of(context)!.nominativDescription,
                icons: [
                  Icons.category_outlined,
                  Icons.nature,
                  Icons.people,
                ]),
            ...N.getPANListItems(listItems, CaseTypeEnum.Nominativ)
          ],
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Nominativ,
        refreshFunction: () => setState(() {
          listItems = N.getPANCombos(
            bank,
            getStaticSentenceStarter,
            getPersonalPronounSentenceStarter,
          );
          N.scrollTo(0, controller);
        }),
      ),
    );
  }
}
