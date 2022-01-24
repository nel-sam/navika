import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class VerbHelpGuide extends StatelessWidget {
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
        backgroundColor: N.getAppBarColor(context),
        iconTheme: N.getAppBarIconTheme(context),
        title: Text(verb.infinitive, style: HEADER_TEXT_STYLE),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
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
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: ACCENT_COLOR, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NSubHeader(
                            text: AppLocalizations.of(context)!.pastTense),
                        getPastSingularChart(context, verb),
                        getPastPluralChart(context, verb),
                      ],
                    ),
                  ),
                ),
                getFutureTenseChart(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getPresentTenseChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 14.0),
        decoration: BoxDecoration(
          border: Border.all(color: ACCENT_COLOR, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            NSubHeader(text: AppLocalizations.of(context)!.presentTense),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NText('Ja ${verb.present.ja}'),
                    NText('Ti ${verb.present.ti}'),
                    NText('On/Ona/Ono ${verb.present.on}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NText('Mi ${verb.present.mi}'),
                    NText('Vi ${verb.present.vi}'),
                    NText('Oni/One/Ona ${verb.present.oni}'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getFutureTenseChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 14.0),
        decoration: BoxDecoration(
          border: Border.all(color: ACCENT_COLOR, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            NSubHeader(text: AppLocalizations.of(context)!.futureTense),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NText('Ja ću ${verb.infinitive}'),
                    NText('Ti ćeš ${verb.infinitive}'),
                    NText('On/Ona/Ono će ${verb.infinitive}'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NText('Mi ćemo ${verb.infinitive}'),
                    NText('Vi ćete ${verb.infinitive}'),
                    NText('Oni/One/Ona će ${verb.infinitive}'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getPastSingularChart(BuildContext context, Verb verb) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(MASCULINE_ICON, color: MASCULINE_COLOR),
            NText('Ja sam ${verb.pastPerfect.singularMasc}'),
            NText('Ti si ${verb.pastPerfect.singularMasc}'),
            NText('On ${verb.pastPerfect.singularMasc}'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(FEMININE_ICON, color: FEMININE_COLOR),
            NText('Ja sam ${verb.pastPerfect.singularFem}'),
            NText('Ti si ${verb.pastPerfect.singularFem}'),
            NText('Ona ${verb.pastPerfect.singularFem}'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(NEUTER_ICON, color: NEUTER_COLOR),
            NText('Ono je ${verb.pastPerfect.ono}'),
          ],
        ),
      ],
    );
  }

  Widget getPastPluralChart(BuildContext context, Verb verb) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NText('Mi smo ${verb.pastPerfect.pluralMasc}'),
              NText('Vi ste ${verb.pastPerfect.pluralMasc}'),
              NText('Oni ste ${verb.pastPerfect.pluralMasc}'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NText('Mi smo ${verb.pastPerfect.pluralFem}'),
              NText('Vi ste ${verb.pastPerfect.pluralFem}'),
              NText('One su ${verb.pastPerfect.pluralFem}'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NText('Ona su ${verb.pastPerfect.onaPl}'),
            ],
          ),
        ],
      ),
    );
  }
}
