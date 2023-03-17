import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/akuzativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/dativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/genitiv-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/instrumental-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/lokativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/nominativ-content.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/vokativ-content.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:nrs_flutter_lib/widgets/n_progress_bar.dart';

List<CaseKey> caseKeys = [];

class CaseKey {
  final GlobalKey key;
  late Cases caseType;
  late double startPixel = 0;
  late double endPixel = 0;
  late double height = 0;

  CaseKey({required this.caseType, required this.key});
}

class ContentSection extends StatelessWidget {
  final String text;
  final Widget content;

  const ContentSection({Key? key, required this.text, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: FONT_SIZE * 2.5),
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
  late Cases startingCase;
  final DialectType dialect;

  DeclensionGuide({
    Key? key,
    this.startingCase = Cases.Nom,
    required this.dialect,
  }) : super(key: key) {
    if (startingCase == Cases.All) {
      startingCase = Cases.Nom;
    }
  }

  @override
  _DeclensionGuideState createState() => _DeclensionGuideState();
}

class _DeclensionGuideState extends State<DeclensionGuide> {
  final casesInOrder = [
    Cases.Nom,
    Cases.Gen,
    Cases.Dat,
    Cases.Aku,
    Cases.Vok,
    Cases.Ins,
    Cases.Lok,
  ];

  late ScrollController controller = ScrollController();
  late bool isAtTop = true;
  late bool isAtBottom = false;
  late int startingIndex = casesInOrder.indexOf(widget.startingCase);
  late double progressPercentage = (startingIndex / casesInOrder.length) * 100;
  late int activeIndex = startingIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.navAppBar(
        title: SbcLabels.cases,
        transTitle: N.t('cases'),
        context: context,
      ),
      body: Center(
        child: SizedBox(
          width: N.getMaxScreenWidth(),
          child: Column(
            children: [
              const AdCard(),
              NProgressBar(progressPercentage: this.progressPercentage),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  padding: EdgeInsets.fromLTRB(FONT_SIZE, 0, FONT_SIZE, 0),
                  child: Column(
                    children: [
                      ContentSection(
                        text: N.getCaseLabel(Cases.Nom),
                        key: _getCaseKey(Cases.Nom),
                        content: NominativGrammarGuideContent(
                          dialect: widget.dialect,
                        ),
                      ),
                      ContentSection(
                        text: N.getCaseLabel(Cases.Gen),
                        key: _getCaseKey(Cases.Gen),
                        content: GenitivGrammarGuideContent(),
                      ),
                      ContentSection(
                        text: N.getCaseLabel(Cases.Dat),
                        key: _getCaseKey(Cases.Dat),
                        content:
                            DativGrammarGuideContent(dialect: widget.dialect),
                      ),
                      ContentSection(
                        text: N.getCaseLabel(Cases.Aku),
                        key: _getCaseKey(Cases.Aku),
                        content: AkuzativGrammarGuideContent(
                            dialect: widget.dialect),
                      ),
                      ContentSection(
                        text: N.getCaseLabel(Cases.Vok),
                        key: _getCaseKey(Cases.Vok),
                        content:
                            VokativGrammarGuideContent(dialect: widget.dialect),
                      ),
                      ContentSection(
                        text: N.getCaseLabel(Cases.Ins),
                        key: _getCaseKey(Cases.Ins),
                        content: InstrumentalGrammarGuideContent(),
                      ),
                      ContentSection(
                        text: N.getCaseLabel(Cases.Lok),
                        key: _getCaseKey(Cases.Lok),
                        content: LokativGrammarGuideContent(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        NFooterMenu(
          buttons: [
            NFooterButton(
              active: !isAtTop,
              icon: Icons.arrow_upward,
              text: N.t('previous'),
              onPressed: () => _moveToPrev(),
            ),
            NFooterButton(
              active: !isAtBottom,
              onPressed: () => _moveToNext(),
              icon: Icons.arrow_downward,
              text: N.t('next'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    caseKeys = casesInOrder.map((caseType) {
      return CaseKey(caseType: caseType, key: GlobalKey());
    }).toList();

    // addPostFrameCallback gets called after the build method is finished
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final startingPoint = _getScrollPoint(widget.startingCase);
      controller.addListener(scrollListener);
      _scrollTo(startingPoint, controller);
    });

    super.initState();
  }

  scrollListener() => setState(() {
        if (controller.position.atEdge) {
          bool atTop = controller.position.pixels == 0;
          isAtTop = atTop;
          isAtBottom = !atTop;
        } else if (activeIndex == caseKeys.length - 1) {
          isAtTop = false;
          isAtBottom = true;
        } else {
          isAtTop = isAtBottom = false;
        }

        double fullHeight = _getFullSizeGuideHeight();
        double percentage = controller.position.pixels / fullHeight;
        percentage = percentage < 0 ? 0 : percentage;
        this.progressPercentage = percentage * 100;

        activeIndex = _getCaseTypeIndexFromCurrentPosition();
      });

  GlobalKey<State<StatefulWidget>> _getCaseKey(Cases caseType) {
    final caseKey =
        caseKeys.firstWhere((caseKey) => caseKey.caseType == caseType);
    return caseKey.key;
  }

  int _getCaseTypeIndexFromCurrentPosition() {
    _setIndixesAndHeight();
    double currentPoint = controller.position.pixels;
    double scrollPoint = 0;

    for (var i = 0; i < caseKeys.length; i++) {
      final caseHeight = caseKeys[i].height;

      scrollPoint += caseHeight;
      if (currentPoint < scrollPoint) return i;
    }

    return casesInOrder.length - 1;
  }

  double _getFullSizeGuideHeight() {
    double totalSize = 0;

    for (var i = 0; i < casesInOrder.length; i++) {
      totalSize += _getHeightFromCaseKey(casesInOrder[i]);
    }

    return totalSize;
  }

  double _getHeightFromCaseKey(Cases caseType) {
    final caseKey = _getCaseKey(caseType);
    return caseKey.currentContext!.size!.height;
  }

  double _getScrollPoint(Cases caseType) {
    double scrollPoint = 0;

    _setIndixesAndHeight();

    for (var i = 0; i < casesInOrder.length; i++) {
      if (casesInOrder[i] == caseType) return scrollPoint;
      scrollPoint += _getHeightFromCaseKey(casesInOrder[i]);
    }

    return scrollPoint;
  }

  _moveToNext() => setState(() {
        if (isAtBottom) return;

        _scrollPrevOrNext(toNext: true);
      });

  _moveToPrev() => setState(() {
        if (isAtTop) return;

        _scrollPrevOrNext(toNext: false);
      });

  _scrollPrevOrNext({required bool toNext}) {
    _setIndixesAndHeight();

    activeIndex = toNext ? activeIndex + 1 : activeIndex - 1;
    activeIndex = activeIndex < 0 ? 0 : activeIndex;
    final scrollPoint = caseKeys[activeIndex].startPixel;
    _scrollTo(scrollPoint, controller);
  }

  void _setIndixesAndHeight() {
    double scrollPoint = 0;

    for (var i = 0; i < caseKeys.length; i++) {
      // Set startPixel, endPixel, and height on each caseKey object as we loop
      final caseHeight = caseKeys[i].height == 0
          ? _getHeightFromCaseKey(casesInOrder[i])
          : caseKeys[i].height;

      caseKeys[i].startPixel = scrollPoint;
      caseKeys[i].endPixel = scrollPoint + caseHeight;
      caseKeys[i].height = caseHeight;
      scrollPoint += caseHeight;
    }
  }

  static _scrollTo(double point, ScrollController controller) =>
      controller.jumpTo(point);
}
