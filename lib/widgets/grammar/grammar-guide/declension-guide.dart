import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/akuzativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/dativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/genitiv-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/instrumental-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/lokativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/nominativ-content.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-menu.dart';
import 'package:nrs_flutter_lib/widgets/n-progress-bar.dart';

const CasesInOrder = [
  Cases.Nom,
  Cases.Gen,
  Cases.Dat,
  Cases.Aku,
  Cases.Vok,
  Cases.Ins,
  Cases.Lok,
];

const double CONTENT_HEIGHT = 1300.0;

class ContentSection extends StatelessWidget {
  final String text;
  final Widget content;

  const ContentSection({Key? key, required this.text, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CONTENT_HEIGHT,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: FONT_SIZE),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: FONT_SIZE * 2.5),
                ),
              ],
            ),
          ),
          content,
        ],
      ),
    );
  }
}

class DeclensionGuide extends StatefulWidget {
  final Cases startingCase;
  final DialectType dialect;

  const DeclensionGuide({
    Key? key,
    this.startingCase = Cases.Nom,
    required this.dialect,
  }) : super(key: key);

  @override
  _DeclensionGuideState createState() => _DeclensionGuideState();
}

class _DeclensionGuideState extends State<DeclensionGuide> {
  late ScrollController controller;
  late bool isAtTop = true;
  late bool isAtBottom = false;
  late int startingIndex = CasesInOrder.indexOf(widget.startingCase);
  late double progressPercentage = (startingIndex / CasesInOrder.length) * 100;

  @override
  Widget build(BuildContext context) {
    double screenWidth = Nrs.getScreenWidth();

    return Scaffold(
      appBar: N.navAppBar(
        title: SbcLabels.cases,
        transTitle: AppLocalizations.of(context)!.cases,
        context: context,
      ),
      body: Column(
        children: [
          const AdCard(),
          NProgressBar(progressPercentage: this.progressPercentage),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: screenWidth > 840 ? screenWidth / 2 : screenWidth,
                child: Column(
                  children: [
                    ContentSection(
                      text: N.getCaseLabel(Cases.Nom),
                      content: NominativGrammarGuideContent(
                        dialect: widget.dialect,
                      ),
                    ),
                    ContentSection(
                      text: N.getCaseLabel(Cases.Gen),
                      content: GenitivGrammarGuideContent(),
                    ),
                    ContentSection(
                      text: N.getCaseLabel(Cases.Dat),
                      content: DativGrammarGuideContent(),
                    ),
                    ContentSection(
                      text: N.getCaseLabel(Cases.Aku),
                      content: AkuzativGrammarGuideContent(),
                    ),
                    ContentSection(
                      text: N.getCaseLabel(Cases.Vok),
                      content: Container(),
                    ),
                    ContentSection(
                      text: N.getCaseLabel(Cases.Ins),
                      content: InstrumentalGrammarGuideContent(),
                    ),
                    ContentSection(
                      text: N.getCaseLabel(Cases.Lok),
                      content: LokativGrammarGuideContent(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        NFooterMenu(
          buttons: [
            NFooterButton(
              active: !isAtTop,
              icon: Icons.arrow_upward,
              text: AppLocalizations.of(context)!.previous,
              onPressed: () => moveToPrev(),
            ),
            NFooterButton(
              active: !isAtBottom,
              onPressed: () => moveToNext(),
              icon: Icons.arrow_downward,
              text: AppLocalizations.of(context)!.next,
            ),
          ],
        ),
      ],
    );
  }

  double getScrollPoint(Cases caseType) =>
      CasesInOrder.indexOf(caseType) * CONTENT_HEIGHT;

  @override
  void initState() {
    final startingPoint = getScrollPoint(widget.startingCase);
    controller = ScrollController(initialScrollOffset: startingPoint);
    controller.addListener(scrollListener);
    super.initState();
  }

  moveToNext() => setState(() {
        if (isAtBottom) return;

        scrollPrevOrNext(toNext: true);
      });

  moveToPrev() => setState(() {
        if (isAtTop) return;

        scrollPrevOrNext(toNext: false);
      });

  scrollListener() => setState(() {
        if (controller.position.atEdge) {
          bool atTop = controller.position.pixels == 0;
          isAtTop = atTop;
          isAtBottom = !atTop;
        } else {
          isAtTop = isAtBottom = false;
        }

        double percentage = controller.position.pixels /
            ((CasesInOrder.length * CONTENT_HEIGHT));
        percentage = percentage < 0 ? 0 : percentage;
        this.progressPercentage = percentage * 100;
      });

  scrollPrevOrNext({required bool toNext}) {
    double currentPoint = controller.position.pixels;
    bool isAtHeader = (currentPoint % CONTENT_HEIGHT) == 0;

    if (isAtHeader && toNext) {
      double scrollPoint = currentPoint + CONTENT_HEIGHT;
      scrollTo(scrollPoint, controller);
    } else if (isAtHeader) {
      double scrollPoint = currentPoint - CONTENT_HEIGHT;
      scrollTo(scrollPoint, controller);
    } else {
      final multFactor = toNext
          ? (currentPoint / CONTENT_HEIGHT).ceil()
          : (currentPoint / CONTENT_HEIGHT).floor();

      double scrollPoint = multFactor * CONTENT_HEIGHT;
      scrollTo(scrollPoint, controller);
    }
  }

  static scrollTo(double point, ScrollController controller) =>
      controller.jumpTo(point);
}
