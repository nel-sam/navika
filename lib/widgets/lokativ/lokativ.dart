import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/lokativ/locativ-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';

// ignore: must_be_immutable
class Lokativ extends StatefulWidget {
  final sentenceStarters = ['Govorim o'];
  final WordBank bank = wordBank;
  var listItems = WidgetHelpers.getPANCombos(
    wordBank,
    ['Govorim o'],
  );

  @override
  _LokativState createState() => _LokativState();
}

class _LokativState extends State<Lokativ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Lokativ'),
        actions: [
          Center(
            child: RefreshButton(
              refreshFunction: () => setState(() {
                widget.listItems = WidgetHelpers.getPANCombos(
                  wordBank,
                  widget.sentenceStarters,
                );
              }),
            ),
          ),
          Center(
            child: ExplanationButton(popupWidget: LocativExplanation()),
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: WidgetHelpers.getPANListItems(
              widget.listItems, CaseTypeEnum.Lokativ),
        ),
      ),
    );
  }
}
