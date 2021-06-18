import 'package:flutter/material.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar-guide/content/akusativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/dativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/genetiv-content.dart';
import 'package:navika/widgets/grammar-guide/content/instrumental-content.dart';
import 'package:navika/widgets/grammar-guide/content/lokativ-content.dart';
import 'package:navika/widgets/grammar-guide/content/nominativ-content.dart';
import 'package:navika/widgets/shared/navika-subheader.dart';

class GrammarGuide extends StatefulWidget {
  const GrammarGuide({Key? key}) : super(key: key);

  @override
  _GrammarGuideState createState() => _GrammarGuideState();
}

class _GrammarGuideState extends State<GrammarGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: N.NavikaAppBar(
          Text(AppLocalizations.of(context)!.grammarGuide), context, []),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              NSubHeader(text: 'Nominativ'),
              NominativGrammarGuideContent(context),
              NSubHeader(text: 'Akusativ'),
              AkusativGrammarGuideContent(context),
              NSubHeader(text: 'Instrumental'),
              InstrumentalGrammarGuideContent(context),
              NSubHeader(text: 'Lokativ'),
              LokativGrammarGuideContent(context),
              NSubHeader(text: 'Dativ'),
              DativGrammarGuideContent(context),
              NSubHeader(text: 'Genetiv'),
              GenetivGrammarGuideContent(context),
            ],
          ),
        ),
      ),
    );
  }
}
