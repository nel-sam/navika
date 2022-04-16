import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
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
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) => BackButton()),
        elevation: APPBAR_ELEVATION,
        backgroundColor: Nrs.getAppBarColor(),
        title: Text(verb.infinitive),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                      text: AppLocalizations.of(context)!.irregular,
                    ),
                ],
              ),
              getPresentTenseChart(context),
              getPastTenseChart(context, verb),
              getFutureTenseChart(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFutureTenseChart(BuildContext context) {
    return Column(
      children: [
        NSubHeader(AppLocalizations.of(context)!.futureTense),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }

  Widget getPastTenseChart(BuildContext context, Verb verb) {
    double iconPairContWidth = (Nrs.getScreenWidth() / 2) - 40;

    return Column(
      children: [
        NSubHeader(AppLocalizations.of(context)!.pastTense),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: iconPairContWidth - 50,
              child: NIconTextPair(
                alignment: MainAxisAlignment.end,
                icon: MASCULINE_ICON,
                color: MASCULINE_COLOR,
                text: AppLocalizations.of(context)!.masculine,
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
                  text: AppLocalizations.of(context)!.feminine,
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
                  text: AppLocalizations.of(context)!.neuter,
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
    );
  }

  Widget getPresentTenseChart(BuildContext context) {
    return Column(
      children: [
        NSubHeader(AppLocalizations.of(context)!.presentTense),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
