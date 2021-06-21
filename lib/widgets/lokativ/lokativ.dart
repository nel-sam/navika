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
    Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';

  start = 'Govorim o';
  return StaticSentenceParts(start: start, end: '');
}

StaticSentenceParts getPersonalPronounSentenceStarter(
    PersonalPronoun personalPronoun, bool isShortForm) {
  late String start = 'TEST';

  return StaticSentenceParts(start: start, end: '');
}

// ignore: must_be_immutable
class Lokativ extends StatefulWidget {
  final sentenceStarters = ['Govorim o'];
  final WordBank bank = wordBank;
  var listItems = N.getPANCombos(
    wordBank,
    getStaticSentenceStarter,
    getPersonalPronounSentenceStarter,
  );

  @override
  _LokativState createState() => _LokativState();
}

class _LokativState extends State<Lokativ> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text('Lokativ'),
      ),
      body: Center(
        child: ListView(
          controller: controller,
          padding: EXERCISE_LIST_PADDING,
          children: [
            NavikaBanner(
                imagePath: CaseImagePaths[CaseTypeEnum.Lokativ]!,
                caseName: 'Lokativ',
                description: AppLocalizations.of(context)!.lokativDescription,
                icons: [
                  Icons.location_on_outlined,
                  Icons.message,
                ]),
            ...N.getPANListItems(widget.listItems, CaseTypeEnum.Lokativ),
          ],
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Lokativ,
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
