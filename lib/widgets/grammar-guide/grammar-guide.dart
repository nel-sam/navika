import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/section-header.dart';
import 'package:navika/widgets/grammar-guide/content/akusativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/dativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/genetiv-content.dart';
import 'package:navika/widgets/grammar-guide/content/instrumental-content.dart';
import 'package:navika/widgets/grammar-guide/content/lokativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/nominativ-content.dart';
import 'package:navika/widgets/shared/footer-button.dart';
import 'package:navika/widgets/shared/home-button.dart';

const double CONTENT_HEIGHT = 840.0;

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
    // This is like this in case detecting widget
    // height becomes easier in the future
    var sizeMap = <CaseTypeEnum, double>{
      CaseTypeEnum.Nominativ: CONTENT_HEIGHT,
      CaseTypeEnum.Akuzativ: CONTENT_HEIGHT,
      CaseTypeEnum.Instrumental: CONTENT_HEIGHT,
      CaseTypeEnum.Lokativ: CONTENT_HEIGHT,
      CaseTypeEnum.Dativ: CONTENT_HEIGHT,
      CaseTypeEnum.Genitiv: CONTENT_HEIGHT,
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
    if (isAtTop) return;

    setState(() {
      isAtBottom = false;

      final currentIndex = CasesInOrder.indexOf(currentCase);
      currentCase = CasesInOrder[currentIndex - 1];
      final scrollPoint = getScrollPoint(currentCase);

      scrollTo(scrollPoint);
    });
  }

  _moveDown() {
    if (isAtBottom) return;

    setState(() {
      isAtTop = false;

      final currentIndex = CasesInOrder.indexOf(currentCase);
      currentCase = CasesInOrder[currentIndex + 1];
      final scrollPoint = getScrollPoint(currentCase);

      scrollTo(scrollPoint);
    });
  }

  contentSection(Widget header, Widget content) {
    return Container(
      height: CONTENT_HEIGHT,
      child: Column(
        children: [
          header,
          content,
        ],
      ),
    );
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
              contentSection(
                SectionHeader('Nominativ'),
                NominativGrammarGuideContent(context),
              ),
              contentSection(
                SectionHeader('Akusativ'),
                AkusativGrammarGuideContent(context),
              ),
              contentSection(
                SectionHeader('Instrumental'),
                InstrumentalGrammarGuideContent(context),
              ),
              contentSection(
                SectionHeader('Lokativ'),
                LokativGrammarGuideContent(context),
              ),
              contentSection(
                SectionHeader('Dativ'),
                DativGrammarGuideContent(context),
              ),
              contentSection(
                SectionHeader('Genetiv'),
                GenetivGrammarGuideContent(context),
              ),
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
              child: FooterButton(
                disabled: isAtTop,
                icon: Icons.arrow_upward,
                text: AppLocalizations.of(context)!.previous,
                onPressed: () => _moveUp(),
                context: context,
              ),
            ),
            HomeButton(context),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
              child: FooterButton(
                disabled: isAtBottom,
                onPressed: () => _moveDown(),
                icon: Icons.arrow_downward,
                text: AppLocalizations.of(context)!.next,
                context: context,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
