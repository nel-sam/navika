import 'package:flutter/material.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/widget-helpers.dart';
import 'package:navika/widgets/akusativ/akuzativ-explanation.dart';
import 'package:navika/widgets/shared/explanation-button.dart';
import 'package:navika/widgets/shared/refresh-button.dart';

import '../../constants.dart';

String getSentenceStarter(Noun noun, bool isPlural) {
  return 'Ja vidim';
}

// ignore: must_be_immutable
class Akuzativ extends StatefulWidget {
  final WordBank bank = wordBank;
  var listItems = WidgetHelpers.getPANCombos(
    wordBank,
    getSentenceStarter,
  );

  @override
  _AkuzativState createState() => _AkuzativState();
}

class _AkuzativState extends State<Akuzativ> {
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: WidgetHelpers.getAppBarColor(context),
        textTheme: WidgetHelpers.getAppBarTextTheme(context),
        iconTheme: WidgetHelpers.getAppBarIconTheme(context),
        title: Text('Akuzativ'),
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
            child: ExplanationButton(popupWidget: AkuzativExplanation()),
          )
        ],
      ),
      body: isPortrait
          ? Center(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: WidgetHelpers.getPANListItems(
                    widget.listItems, CaseTypeEnum.Akuzativ),
              ),
            )
          : Container(
              child: GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: WidgetHelpers.getPANListItems(
                    widget.listItems, CaseTypeEnum.Akuzativ),
              ),
            ),
    );
  }
}
