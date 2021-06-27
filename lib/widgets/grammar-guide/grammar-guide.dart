import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/section-header.dart';
import 'package:navika/widgets/grammar-guide/content/akuzativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/dativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/genitiv-content.dart';
import 'package:navika/widgets/grammar-guide/content/instrumental-content.dart';
import 'package:navika/widgets/grammar-guide/content/lokativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/nominativ-content.dart';
import 'package:navika/widgets/shared/footer-button.dart';
import 'package:navika/widgets/shared/home-button.dart';

const double CONTENT_HEIGHT = 1200.0;

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
  final CaseTypeEnum startingCase;

  const GrammarGuide({
    Key? key,
    this.startingCase = CaseTypeEnum.Nominativ,
  }) : super(key: key);

  @override
  _GrammarGuideState createState() => _GrammarGuideState();
}

class _GrammarGuideState extends State<GrammarGuide> {
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
        print('currentPoint: ' + controller.position.pixels.toString());
        isAtTop = getIsAtTop();
        isAtBottom = getIsAtBottom();
      });

  bool getIsAtTop() => controller.position.pixels <= 10;

  bool getIsAtBottom() =>
      controller.position.pixels >= CONTENT_HEIGHT * (CasesInOrder.length - 1);

  double getScrollPoint(CaseTypeEnum caseType) =>
      CasesInOrder.indexOf(caseType) * CONTENT_HEIGHT;

  moveToPrev() => setState(() {
        if (isAtTop) return;

        scrollPrevOrNext(toNext: false);
      });

  moveToNext() {
    if (isAtBottom) return;

    setState(() {
      isAtTop = false;
      scrollPrevOrNext(toNext: true);
    });
  }

  scrollPrevOrNext({required bool toNext}) {
    double currentPoint = controller.position.pixels;
    bool isAtHeader = (currentPoint % CONTENT_HEIGHT) == 0;

    if (isAtHeader && toNext) {
      N.scrollTo(currentPoint + CONTENT_HEIGHT, controller);
    } else if (isAtHeader) {
      N.scrollTo(currentPoint - CONTENT_HEIGHT, controller);
    } else {
      final mult = toNext
          ? (currentPoint / CONTENT_HEIGHT).ceil()
          : (currentPoint / CONTENT_HEIGHT).floor();

      double scrollPoint = mult * CONTENT_HEIGHT;
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
            HomeButton(context),
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
