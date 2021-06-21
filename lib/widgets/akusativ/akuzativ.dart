import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

StaticSentenceParts getStaticSentenceStarter(
    Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';
  String end = '';

  if (noun.tags.contains(Tags.Location)) {
    start = 'Idemo na';
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

StaticSentenceParts getPersonalPronounSentenceStarter(
    PersonalPronoun personalPronoun, bool isShortForm) {
  final actualValue = isShortForm
      ? personalPronoun.nominativ.shortForm
      : personalPronoun.nominativ.general;
  String start = '';
  String end = '';

  if (actualValue != 'mi' && N.coinFlip()) {
    start = 'Mi vidimo';
  } else if (actualValue != 'ti' && N.coinFlip()) {
    start = 'Daj to ';
  } else {
    start = 'Molim';
  }

  return StaticSentenceParts(start: start, end: end);
}

// ignore: must_be_immutable
class Akuzativ extends StatefulWidget {
  final WordBank bank = wordBank;
  List<PANExerciseItem> listItems = N.getPANCombos(
      wordBank, getStaticSentenceStarter, getPersonalPronounSentenceStarter);

  @override
  _AkuzativState createState() => _AkuzativState();
}

class _AkuzativState extends State<Akuzativ> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text('Akuzativ'),
      ),
      body: Center(
        child: ListView(
          controller: controller,
          padding: EXERCISE_LIST_PADDING,
          children: [
            NavikaBanner(
                imagePath: CaseImagePaths[CaseTypeEnum.Akuzativ]!,
                caseName: 'Akuzativ',
                description: AppLocalizations.of(context)!.akuzativDescription,
                icons: [
                  Icons.remove_red_eye_outlined,
                  Icons.car_rental,
                  Icons.arrow_forward,
                  Icons.euro,
                ]),
            ...N.getPANListItems(widget.listItems, CaseTypeEnum.Akuzativ)
          ],
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Akuzativ,
        refreshFunction: () => setState(() {
          widget.listItems = N.getPANCombos(
            wordBank,
            getStaticSentenceStarter,
            getPersonalPronounSentenceStarter,
          );
          N.scrollTo(0, controller);
        }),
      ),
    );
  }
}
