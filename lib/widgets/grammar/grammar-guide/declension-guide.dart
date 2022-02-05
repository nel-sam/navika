import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/section-header.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/akuzativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/dativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/genitiv-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/instrumental-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/lokativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/nominativ-content.dart';
import 'package:navika/widgets/shared/footer-button.dart';

const double CONTENT_HEIGHT = 1200.0;

const CasesInOrder = [
  Cases.Nom,
  Cases.Aku,
  Cases.Ins,
  Cases.Lok,
  Cases.Dat,
  Cases.Gen,
  // Cases.Vokativ,
];

class DeclensionGuide extends StatefulWidget {
  final Cases startingCase;

  const DeclensionGuide({
    Key? key,
    this.startingCase = Cases.Nom,
  }) : super(key: key);

  @override
  _DeclensionGuideState createState() => _DeclensionGuideState();
}

class _DeclensionGuideState extends State<DeclensionGuide> {
  late ScrollController controller;
  late bool isAtTop = false;
  late bool isAtBottom = false;

  @override
  void initState() {
    controller = ScrollController(
        initialScrollOffset: getScrollPoint(widget.startingCase));
    controller.addListener(scrollListener);
    super.initState();
  }

  scrollListener() => setState(() {
        isAtTop = getIsAtTop();
        isAtBottom = getIsAtBottom();
      });

  bool getIsAtTop() => controller.position.pixels <= 10;

  bool getIsAtBottom() =>
      controller.position.pixels >= CONTENT_HEIGHT * (CasesInOrder.length - 1);

  double getScrollPoint(Cases caseType) =>
      CasesInOrder.indexOf(caseType) * CONTENT_HEIGHT;

  moveToPrev() => setState(() {
        if (isAtTop) return;
        scrollPrevOrNext(toNext: false);
      });

  moveToNext() => setState(() {
        if (isAtBottom) return;
        scrollPrevOrNext(toNext: true);
      });

  scrollPrevOrNext({required bool toNext}) {
    double currentPoint = controller.position.pixels;
    bool isAtHeader = (currentPoint % CONTENT_HEIGHT) == 0;

    if (isAtHeader && toNext) {
      N.scrollTo(currentPoint + CONTENT_HEIGHT, controller);
    } else if (isAtHeader) {
      N.scrollTo(currentPoint - CONTENT_HEIGHT, controller);
    } else {
      final multFactor = toNext
          ? (currentPoint / CONTENT_HEIGHT).ceil()
          : (currentPoint / CONTENT_HEIGHT).floor();

      double scrollPoint = multFactor * CONTENT_HEIGHT;
      N.scrollTo(scrollPoint, controller);
    }
  }

  contentSection(Widget header, Widget content) => Container(
        height: CONTENT_HEIGHT,
        child: Column(
          children: [
            header,
            content,
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    double screenWidth = N.getScreenWidth();

    return Scaffold(
      appBar: N.NavikaAppBar(
        title: SbcLabels.cases,
        transTitle: AppLocalizations.of(context)!.cases,
        context: context,
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: screenWidth > 840 ? screenWidth / 2 : screenWidth,
            child: Column(
              children: [
                contentSection(
                  SectionHeader(N.getCaseLabel(Cases.Nom)),
                  NominativGrammarGuideContent(),
                ),
                contentSection(
                  SectionHeader('Akuzativ'),
                  AkuzativGrammarGuideContent(),
                ),
                contentSection(
                  SectionHeader('Instrumental'),
                  InstrumentalGrammarGuideContent(),
                ),
                contentSection(
                  SectionHeader('Lokativ'),
                  LokativGrammarGuideContent(),
                ),
                contentSection(
                  SectionHeader('Dativ'),
                  DativGrammarGuideContent(),
                ),
                contentSection(
                  SectionHeader('Genitiv'),
                  GenitivGrammarGuideContent(),
                ),
              ],
            ),
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
                onPressed: () => moveToPrev(),
                context: context,
              ),
            ),
            //HomeButton(context),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: FOOTER_ICON_BOTTOM_PADDING),
              child: FooterButton(
                disabled: isAtBottom,
                onPressed: () => moveToNext(),
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
