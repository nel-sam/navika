import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/shared/footer.dart';

import '../../constants.dart';

String getSentenceStarter(Noun noun, bool isPlural) {
  if (noun.isAnimate) return 'Daj ';
  if (isPlural) return 'Slični su ';
  return 'Slično je ';
}

// ignore: must_be_immutable
class Dativ extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = N.getPANCombos(
    wordBank,
    getSentenceStarter,
  );

  @override
  _DativState createState() => _DativState();
}

class _DativState extends State<Dativ> {
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
          padding: const EdgeInsets.all(8),
          children: N.getPANListItems(widget.listItems, CaseTypeEnum.Dativ),
        ),
      ),
      persistentFooterButtons: NavikaChildFooterButtons(
        context: context,
        caseType: CaseTypeEnum.Dativ,
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
