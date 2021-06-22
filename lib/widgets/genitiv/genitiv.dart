import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/models/personal-pronoun.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer.dart';
import 'package:navika/widgets/shared/navika-banner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/adjective.dart';
import 'package:navika/models/noun.dart';

StaticSentenceParts getStaticSentenceStarter(
    Noun noun, bool isPlural, Adjective? pronoun) {
  String start = '';
  if (isPlural) {
    start = 'To su';
  } else {
    start = 'To je';
  }

  return StaticSentenceParts(start: start, end: '');
}

StaticSentenceParts getPersonalPronounSentenceStarter(
    PersonalPronoun personalPronoun, bool isShortForm) {
  return StaticSentenceParts(start: 'TEST', end: 'TEST');
}

class GenitivExerciseItem {
  Adjective pronoun;
  Genders gender;
  bool isPlural;
  Noun noun1;
  Noun noun2;

  GenitivExerciseItem(
      {required this.pronoun,
      required this.noun1,
      required this.gender,
      required this.isPlural,
      required this.noun2});
}

// ignore: must_be_immutable
class Genitiv extends StatefulWidget {
  @override
  _GenitivState createState() => _GenitivState();
}

class _GenitivState extends State<Genitiv> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final WordBank bank = wordBank;
    List<PANExerciseItem> listItems = N.getPANCombos(
        bank, getStaticSentenceStarter, getPersonalPronounSentenceStarter);

    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: N.getAppBarColor(context),
        textTheme: N.getAppBarTextTheme(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text('Genitiv'),
      ),
      body: Center(
        child: ListView(
          controller: controller,
          padding: EXERCISE_LIST_PADDING,
          children: [
            NavikaBanner(
                imagePath: CaseImagePaths[CaseTypeEnum.Genitiv]!,
                caseName: 'Genitiv',
                description: AppLocalizations.of(context)!.genitiveDescription,
                icons: [
                  Icons.category_outlined,
                  Icons.nature,
                  Icons.people,
                ]),
            ...N.getPANListItems(listItems, CaseTypeEnum.Genitiv)
          ],
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Genitiv,
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
