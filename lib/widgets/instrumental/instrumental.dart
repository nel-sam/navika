import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/instrumental/instrumental-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';

String getSentenceStarter(Noun noun, bool isPlural) {
  return 'Idem sa';
}

// ignore: must_be_immutable
class Instrumental extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = WidgetHelpers.getPANCombos(
    wordBank,
    getSentenceStarter,
  );

  @override
  _InstrumentalState createState() => _InstrumentalState();
}

class _InstrumentalState extends State<Instrumental> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Instrumental'),
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
            child: ExplanationButton(popupWidget: InstrumentalExplanation()),
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: WidgetHelpers.getPANListItems(
              widget.listItems, CaseTypeEnum.Instrumental),
        ),
      ),
    );
  }
}
