import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_icon_text_pair.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class VerbHelpGuide extends StatelessWidget {
  static const double sidePadding = 38;
  final Verb verb;
  final String perfectiveness;

  const VerbHelpGuide({
    Key? key,
    required this.verb,
    required this.perfectiveness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.navAppBar(
          title: verb.infinitive, context: context, showSettingsButton: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NIconTextPair(
                  text: verb.getTranslation(context),
                  icon: Icons.translate,
                ),
                Text(
                  perfectiveness,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                if (this.verb.isIrregular)
                  NIconTextPair(
                    icon: Icons.error_outline,
                    text: N.t('irregular'),
                  ),
              ],
            ),
            getPresentTenseChart(context),
            getPastTenseChart(context, verb),
            getFutureTenseChart(context),
          ],
        ),
      ),
    );
  }

  Widget getFutureTenseChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NSubHeader(N.t('futureTense')),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NTextSpan('Ja ću ${verb.infinitive}'),
              NTextSpan('Ti ćeš ${verb.infinitive}'),
              NTextSpan('On/Ona/Ono će ${verb.infinitive}'),
              NTextSpan('Mi ćemo ${verb.infinitive}'),
              NTextSpan('Vi ćete ${verb.infinitive}'),
              NTextSpan('Oni/One/Ona će ${verb.infinitive}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget getPastTenseChart(BuildContext context, Verb verb) {
    final screenWidth = Nrs.getScreenWidth();
    double iconPairContWidth = (screenWidth / 2) - 40;
    bool showLongForm = screenWidth > 400;

    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        children: [
          NSubHeader(N.t('pastTense')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: iconPairContWidth - 50,
                child: NIconTextPair(
                  alignment: MainAxisAlignment.end,
                  icon: MASCULINE_ICON,
                  color: MASCULINE_COLOR,
                  text: N.t(showLongForm ? 'masculine' : 'masc'),
                ),
              ),
              Container(
                width: iconPairContWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NTextSpan('Ja sam ${verb.pastPerfect.singularMasc}'),
                    NTextSpan('Ti si ${verb.pastPerfect.singularMasc}'),
                    NTextSpan('On je ${verb.pastPerfect.singularMasc}'),
                    NTextSpan('Mi smo ${verb.pastPerfect.pluralMasc}'),
                    NTextSpan('Vi ste ${verb.pastPerfect.pluralMasc}'),
                    NTextSpan('Oni ste ${verb.pastPerfect.pluralMasc}'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: FONT_SIZE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: iconPairContWidth - 50,
                  child: NIconTextPair(
                    alignment: MainAxisAlignment.end,
                    icon: FEMININE_ICON,
                    color: FEMININE_COLOR,
                    text: N.t(showLongForm ? 'feminine' : 'fem'),
                  ),
                ),
                Container(
                  width: iconPairContWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NTextSpan('Ja sam ${verb.pastPerfect.singularFem}'),
                      NTextSpan('Ti si ${verb.pastPerfect.singularFem}'),
                      NTextSpan('Ona je ${verb.pastPerfect.singularFem}'),
                      NTextSpan('Mi smo ${verb.pastPerfect.pluralFem}'),
                      NTextSpan('Vi ste ${verb.pastPerfect.pluralFem}'),
                      NTextSpan('One su ${verb.pastPerfect.pluralFem}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: FONT_SIZE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: iconPairContWidth - 50,
                  child: NIconTextPair(
                    alignment: MainAxisAlignment.end,
                    icon: NEUTER_ICON,
                    color: NEUTER_COLOR,
                    text: N.t(showLongForm ? 'neuter' : 'neut'),
                  ),
                ),
                Container(
                  width: iconPairContWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NTextSpan('Ono je ${verb.pastPerfect.ono}'),
                      NTextSpan('Ona su ${verb.pastPerfect.onaPl}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getPresentTenseChart(BuildContext context) {
    return Column(
      children: [
        NSubHeader(N.t('presentTense')),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NTextSpan('Ja ${verb.present.ja}'),
            NTextSpan('Ti ${verb.present.ti}'),
            NTextSpan('On/Ona/Ono ${verb.present.on}'),
            NTextSpan('Mi ${verb.present.mi}'),
            NTextSpan('Vi ${verb.present.vi}'),
            NTextSpan('Oni/One/Ona ${verb.present.oni}'),
          ],
        ),
      ],
    );
  }
}
