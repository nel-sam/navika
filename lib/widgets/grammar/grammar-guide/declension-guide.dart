import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/akuzativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/dativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/genitiv-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/instrumental-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/lokativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/nominativ-content.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-menu.dart';

const CasesInOrder = [
  Cases.Nom,
  Cases.Aku,
  Cases.Ins,
  Cases.Lok,
  Cases.Dat,
  Cases.Gen,
  // Cases.Vokativ,
];

const double CONTENT_HEIGHT = 1200.0;

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
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              height: 40,
              color: Nrs.getPrimaryColor(context),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
  Widget build(BuildContext context) {
    double screenWidth = Nrs.getScreenWidth();

    return Scaffold(
      appBar: Nrs.NrsAppBar(
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
                ContentSection(
                  text: N.getCaseLabel(Cases.Nom),
                  content: NominativGrammarGuideContent(),
                ),
                ContentSection(
                  text: N.getCaseLabel(Cases.Aku),
                  content: AkuzativGrammarGuideContent(),
                ),
                ContentSection(
                  text: N.getCaseLabel(Cases.Ins),
                  content: InstrumentalGrammarGuideContent(),
                ),
                ContentSection(
                  text: N.getCaseLabel(Cases.Lok),
                  content: LokativGrammarGuideContent(),
                ),
                ContentSection(
                  text: N.getCaseLabel(Cases.Dat),
                  content: DativGrammarGuideContent(),
                ),
                ContentSection(
                  text: N.getCaseLabel(Cases.Gen),
                  content: GenitivGrammarGuideContent(),
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
            NFooterMenu(
              buttons: [
                NFooterButton(
                  disabled: isAtTop,
                  icon: Icons.arrow_upward,
                  text: AppLocalizations.of(context)!.previous,
                  onPressed: () => moveToPrev(),
                ),
                NFooterButton(
                  disabled: isAtBottom,
                  onPressed: () => moveToNext(),
                  icon: Icons.arrow_downward,
                  text: AppLocalizations.of(context)!.next,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  bool getIsAtBottom() =>
      controller.position.pixels >= CONTENT_HEIGHT * (CasesInOrder.length - 1);

  bool getIsAtTop() => controller.position.pixels <= 10;

  double getScrollPoint(Cases caseType) =>
      CasesInOrder.indexOf(caseType) * CONTENT_HEIGHT;

  @override
  void initState() {
    controller = ScrollController(
        initialScrollOffset: getScrollPoint(widget.startingCase));
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
        isAtTop = getIsAtTop();
        isAtBottom = getIsAtBottom();
      });

  scrollPrevOrNext({required bool toNext}) {
    double currentPoint = controller.position.pixels;
    bool isAtHeader = (currentPoint % CONTENT_HEIGHT) == 0;

    if (isAtHeader && toNext) {
      scrollTo(currentPoint + CONTENT_HEIGHT, controller);
    } else if (isAtHeader) {
      scrollTo(currentPoint - CONTENT_HEIGHT, controller);
    } else {
      final multFactor = toNext
          ? (currentPoint / CONTENT_HEIGHT).ceil()
          : (currentPoint / CONTENT_HEIGHT).floor();

      double scrollPoint = multFactor * CONTENT_HEIGHT;
      scrollTo(scrollPoint, controller);
    }
  }

  static scrollTo(double point, controller) {
    controller.animateTo(point,
        curve: Curves.linearToEaseOut, duration: Duration(milliseconds: 800));
  }
}
