import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guides/shared/content-section.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:navika/widgets/shared/ad-card.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_progress_bar.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class CountingContent extends StatelessWidget {
  const CountingContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NTextSpan(N.t('countingDescription')),
      ],
    );
  }
}

class NumberGuide extends StatefulWidget {
  final DialectType dialect;

  const NumberGuide({
    Key? key,
    required this.dialect,
  }) : super(key: key);

  @override
  State<NumberGuide> createState() => _NumberGuideState();
}

class NumbersContent extends StatelessWidget {
  const NumbersContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NTextSpan(N.t('numbersDescription')),
      ],
    );
  }
}

class OrdinalContent extends StatelessWidget {
  const OrdinalContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NTextSpan(N.t('ordinalDescription')),
      ],
    );
  }
}

class _NumberGuideState extends State<NumberGuide> {
  late ScrollController controller = ScrollController();
  late int startingIndex = 0;
  late double progressPercentage = (startingIndex / 2) * 100;

  @override
  Widget build(BuildContext context) {
    final numbersGlobalKey = GlobalKey();
    final countingGlobalKey = GlobalKey();
    final ordinalGlobalKey = GlobalKey();

    return Scaffold(
      appBar: N.navAppBar(
        title: SbcLabels.numbers,
        transTitle: N.t('numbers'),
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
                            text: N.t('numbers'),
                            key: numbersGlobalKey,
                            content: NumbersContent()),
                        ContentSection(
                          text: N.t('counting'),
                          key: countingGlobalKey,
                          content: CountingContent(),
                        ),
                        ContentSection(
                          text: N.t('ordinals'),
                          key: ordinalGlobalKey,
                          content: OrdinalContent(),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
