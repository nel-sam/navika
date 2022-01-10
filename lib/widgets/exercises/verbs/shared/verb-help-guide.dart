import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/verb.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/shared/icon-text-pair.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NSubHeader(
                        text: AppLocalizations.of(context)!.presentTense),
                    Text('Ja: ${verb.present.ja}'),
                    Text('Ti: ${verb.present.ti}'),
                    Text('Mi: ${verb.present.mi}'),
                    Text('Vi: ${verb.present.vi}'),
                    Text('On/Ona/Oni: ${verb.present.on}'),
                    Text('Oni/One/Ona: ${verb.present.oni}'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NSubHeader(
                        text: AppLocalizations.of(context)!.pastTense),
                    Text('Ja sam: ${verb.pastPerfect.singularMasc}'),
                    Text('Ti: ${verb.pastPerfect.singularMasc}'),
                    Text('Mi: ${verb.present.mi}'),
                    Text('Vi: ${verb.present.vi}'),
                    Text('On/Ona/Oni: ${verb.present.on}'),
                    Text('Oni/One/Ona: ${verb.present.oni}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
