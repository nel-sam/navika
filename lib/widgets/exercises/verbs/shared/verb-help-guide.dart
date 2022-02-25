import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

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
                  IconTextPair(
                    text: verb.getTranslation(context),
                    icon: Icons.translate,
                  ),
                  Text(
                    perfectiveness,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  if (this.verb.isIrregular)
                    IconTextPair(
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
        NSubHeader(text: AppLocalizations.of(context)!.futureTense),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NText('Ja ću ${verb.infinitive}'),
            NText('Ti ćeš ${verb.infinitive}'),
            NText('On/Ona/Ono će ${verb.infinitive}'),
            NText('Mi ćemo ${verb.infinitive}'),
            NText('Vi ćete ${verb.infinitive}'),
            NText('Oni/One/Ona će ${verb.infinitive}'),
          ],
        ),
      ],
    );
  }

  Widget getPastTenseChart(BuildContext context, Verb verb) {
    double iconPairContWidth = (N.getScreenWidth() / 2) - 40;

    return Column(
      children: [
        NSubHeader(text: AppLocalizations.of(context)!.pastTense),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: iconPairContWidth - 50,
              child: IconTextPair(
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
                  NText('Ja sam ${verb.pastPerfect.singularMasc}'),
                  NText('Ti si ${verb.pastPerfect.singularMasc}'),
                  NText('On je ${verb.pastPerfect.singularMasc}'),
                  NText('Mi smo ${verb.pastPerfect.pluralMasc}'),
                  NText('Vi ste ${verb.pastPerfect.pluralMasc}'),
                  NText('Oni ste ${verb.pastPerfect.pluralMasc}'),
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
                child: IconTextPair(
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
                    NText('Ja sam ${verb.pastPerfect.singularFem}'),
                    NText('Ti si ${verb.pastPerfect.singularFem}'),
                    NText('Ona je ${verb.pastPerfect.singularFem}'),
                    NText('Mi smo ${verb.pastPerfect.pluralFem}'),
                    NText('Vi ste ${verb.pastPerfect.pluralFem}'),
                    NText('One su ${verb.pastPerfect.pluralFem}'),
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
                child: IconTextPair(
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
                    NText('Ono je ${verb.pastPerfect.ono}'),
                    NText('Ona su ${verb.pastPerfect.onaPl}'),
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
        NSubHeader(text: AppLocalizations.of(context)!.presentTense),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NText('Ja ${verb.present.ja}'),
            NText('Ti ${verb.present.ti}'),
            NText('On/Ona/Ono ${verb.present.on}'),
            NText('Mi ${verb.present.mi}'),
            NText('Vi ${verb.present.vi}'),
            NText('Oni/One/Ona ${verb.present.oni}'),
          ],
        ),
      ],
    );
  }
}
