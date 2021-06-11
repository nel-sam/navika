import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/dativ/dativ-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';

import '../../constants.dart';

String getSentenceStarter(Noun noun, bool isPlural) {
  if (noun.isAnimate) return 'Daj ';
  if (isPlural) return 'Slični su ';
  return 'Slično je ';
}

// ignore: must_be_immutable
class Dativ extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = WidgetHelpers.getPANCombos(
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
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Dativ'),
        actions: [
          Center(
            child: RefreshButton(
              refreshFunction: () => setState(() {
                widget.listItems = WidgetHelpers.getPANCombos(
                  wordBank,
                  getSentenceStarter,
                );
              }),
            ),
          ),
          Center(
            child: ExplanationButton(popupWidget: DativExplanation()),
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: WidgetHelpers.getPANListItems(
              widget.listItems, CaseTypeEnum.Dativ),
        ),
      ),
    );
  }
}
