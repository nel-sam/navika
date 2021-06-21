import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-banner.dart';

String getSentenceStarter(Noun noun, bool isPlural, DeclinableWord? pronoun) {
  return 'Govorim o';
}

String getPersonalPronounSentenceStarter(Noun personalPronoun, bool isPlural) {
  return 'TEST';
}

// ignore: must_be_immutable
class Lokativ extends StatefulWidget {
  final sentenceStarters = ['Govorim o'];
  final WordBank bank = wordBank;
  var listItems = N.getPANCombos(
    wordBank,
    getSentenceStarter,
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
            getSentenceStarter,
            getPersonalPronounSentenceStarter,
          );
          N.scrollTo(0, controller);
        }),
      ),
    );
  }
}
