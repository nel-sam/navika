import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer.dart';

import '../../constants.dart';

String getSentenceStarter(Noun noun, bool isPlural) {
  return 'Govorim o';
}

// ignore: must_be_immutable
class Lokativ extends StatefulWidget {
  final sentenceStarters = ['Govorim o'];
  final WordBank bank = wordBank;
  var listItems = N.getPANCombos(
    wordBank,
    getSentenceStarter,
  );

  @override
  _LokativState createState() => _LokativState();
}

class _LokativState extends State<Lokativ> {
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
          padding: const EdgeInsets.all(8),
          children: N.getPANListItems(widget.listItems, CaseTypeEnum.Lokativ),
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Lokativ,
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
