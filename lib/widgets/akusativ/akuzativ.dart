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
  if (noun.tags.contains(Tags.Location)) {
    return 'Idemo na ';
  }

  if (noun.tags.contains(Tags.Food)) {
    return N.coinFlip() ? 'Ću jesti ' : 'Želi ';
  }

  if (pronoun != null && pronoun.nominativ.masculine.singular != 'moj')
    return N.coinFlip() ? 'Ja vidim' : 'Volim';

  if (noun.tags.contains(Tags.Portable)) {
    return 'Daj mi ';
  }

  return 'Vidimo ';
}

// ignore: must_be_immutable
class Akuzativ extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = N.getPANCombos(
    wordBank,
    getSentenceStarter,
  );

  @override
  _AkuzativState createState() => _AkuzativState();
}

class _AkuzativState extends State<Akuzativ> {
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
          padding: const EdgeInsets.all(8),
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
            getSentenceStarter,
          );
        }),
      ),
    );
  }
}
