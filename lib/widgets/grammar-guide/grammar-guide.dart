import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
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

const CasesInOrder = [
  CaseTypeEnum.Nominativ,
  CaseTypeEnum.Akuzativ,
  CaseTypeEnum.Instrumental,
  CaseTypeEnum.Lokativ,
  CaseTypeEnum.Dativ,
  CaseTypeEnum.Genitiv,
  // CaseTypeEnum.Vokativ,
];

class GrammarGuide extends StatefulWidget {
  final CaseTypeEnum scrollToCase;

  const GrammarGuide({
    Key? key,
    this.scrollToCase = CaseTypeEnum.Nominativ,
  }) : super(key: key);

  @override
  _GrammarGuideState createState() => _GrammarGuideState();
}

class _GrammarGuideState extends State<GrammarGuide> {
  late ScrollController controller;
  late bool isAtTop = getIsAtTop();
  late bool isAtBottom = getIsAtBottom();
  late CaseTypeEnum currentCase;

  @override
  void initState() {
    currentCase = widget.scrollToCase;
    controller = ScrollController(
      initialScrollOffset: getScrollPoint(currentCase),
    );

    controller.addListener(scrollListener);
    super.initState();
  }

  bool getIsAtTop() {
    return currentCase == CasesInOrder.first;
  }

  bool getIsAtBottom() {
    return currentCase == CasesInOrder.last;
  }

  scrollListener() {
    if (getIsAtTop()) {
      setState(() {
        isAtTop = true;
      });
    }

    if (getIsAtBottom()) {
      setState(() {
        isAtBottom = true;
      });
    }
  }

  double getScrollPoint(CaseTypeEnum caseType) {
    var sizeMap = <CaseTypeEnum, double>{
      CaseTypeEnum.Nominativ: 870,
      CaseTypeEnum.Akuzativ: 860,
      CaseTypeEnum.Instrumental: 770,
      CaseTypeEnum.Lokativ: 720,
      CaseTypeEnum.Dativ: 770,
      CaseTypeEnum.Genitiv: 770,
    };

    double scrollPoint = 0;

    for (final c in CasesInOrder) {
      if (c == caseType) break;
      scrollPoint += sizeMap[c]!;
    }

    return scrollPoint;
  }

  scrollTo(double point) {
    controller.animateTo(point,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveUp() {
    setState(() {
      isAtBottom = false;

      final currentIndex = CasesInOrder.indexOf(currentCase);
      currentCase = CasesInOrder[currentIndex - 1];
      final scrollPoint = getScrollPoint(currentCase);

      scrollTo(scrollPoint);
    });
  }

  _moveDown() {
    setState(() {
      isAtTop = false;

      final currentIndex = CasesInOrder.indexOf(currentCase);
      currentCase = CasesInOrder[currentIndex + 1];
      final scrollPoint = getScrollPoint(currentCase);

      scrollTo(scrollPoint);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.NavikaAppBar(
          Text(AppLocalizations.of(context)!.grammarGuide), context, []),
      body: SingleChildScrollView(
        controller: controller,
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
