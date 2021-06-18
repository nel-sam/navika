import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar-guide/content/akusativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/dativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/genetiv-content.dart';
import 'package:navika/widgets/grammar-guide/content/instrumental-content.dart';
import 'package:navika/widgets/grammar-guide/content/lokativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/nominativ-content.dart';
import 'package:navika/widgets/shared/home-button.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';

class GrammarGuide extends StatefulWidget {
  const GrammarGuide({Key? key}) : super(key: key);

  @override
  _GrammarGuideState createState() => _GrammarGuideState();
}

class _GrammarGuideState extends State<GrammarGuide> {
  late ScrollController _controller;
  late bool isAtTop = false;
  late bool isAtBottom = false;
  final itemSize = 1000;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        isAtBottom = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        isAtTop = true;
      });
    }
  }

  _moveUp() {
    setState(() {
      isAtBottom = false;
    });
    _controller.animateTo(_controller.offset - itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    setState(() {
      isAtTop = false;
    });

    _controller.animateTo(_controller.offset + itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(_scrollListener);

    return Scaffold(
      appBar: N.NavikaAppBar(
          Text(AppLocalizations.of(context)!.grammarGuide), context, []),
      body: SingleChildScrollView(
        controller: _controller,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              NSubHeader(text: 'Nominativ'),
              NominativGrammarGuideContent(context),
              NSubHeader(text: 'Akusativ'),
              AkusativGrammarGuideContent(context),
              NSubHeader(text: 'Instrumental'),
              InstrumentalGrammarGuideContent(context),
              NSubHeader(text: 'Lokativ'),
              LokativGrammarGuideContent(context),
              NSubHeader(text: 'Dativ'),
              DativGrammarGuideContent(context),
              NSubHeader(text: 'Genetiv'),
              GenetivGrammarGuideContent(context),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
              child: TextButton.icon(
                onPressed: () {
                  if (!isAtTop) _moveUp();
                },
                icon: Icon(Icons.arrow_upward,
                    color: isAtTop ? Colors.grey : ICON_COLOR),
                label: Text(AppLocalizations.of(context)!.previous),
              ),
            ),
            HomeButton(context),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
              child: TextButton.icon(
                onPressed: () {
                  if (!isAtBottom) _moveDown();
                },
                icon: Icon(Icons.arrow_downward,
                    color: isAtBottom ? Colors.grey : ICON_COLOR),
                label: Text(AppLocalizations.of(context)!.next),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
