import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

StaticSentenceParts getSentenceStarter(
    Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';

  if (noun.isAnimate) {
    start = 'Daj to ';
  } else if (isPlural) {
    start = 'Slični su ';
  } else {
    start = 'Slično je ';
  }

  return StaticSentenceParts(start: start, end: '');
}

StaticSentenceParts getPersonalPronounSentenceStarter(
    PersonalPronoun personalPronoun, bool isShortForm) {
  return StaticSentenceParts(start: 'TEST', end: 'TEST');
}

// ignore: must_be_immutable
class Dativ extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = N.getPANCombos(
    wordBank,
    getSentenceStarter,
    getPersonalPronounSentenceStarter,
  );

  @override
  _DativState createState() => _DativState();
}

class _DativState extends State<Dativ> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text('Dativ'),
      ),
      body: Center(
        child: ListView(
          controller: controller,
          padding: EXERCISE_LIST_PADDING,
          children: [
            NavikaBanner(
                imagePath: CaseImagePaths[CaseTypeEnum.Dativ]!,
                caseName: 'Dativ',
                description: AppLocalizations.of(context)!.dativDescription,
                icons: [
                  Icons.person,
                  Icons.arrow_forward,
                  Icons.people,
                ]),
            ...N.getPANListItems(widget.listItems, CaseTypeEnum.Dativ),
          ],
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Dativ,
        refreshFunction: () => setState(() {
          widget.listItems = N.getPANCombos(
            wordBank,
            getSentenceStarter,
            getPersonalPronounSentenceStarter,
          );
          N.scrollTo(0, controller);
        }),
      ),
    );
  }
}
