import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/grammar/grammar-guide/content/declension-tables/instrumental-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';

class InstrumentalGrammarGuideContent extends StatelessWidget {
  const InstrumentalGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getDescription(context),
        getExampleSentences(context),
        InstrumentalDeclensionTable(),
        getPossessivePronounSection(context),
      ],
    );
  }
}

Widget getPossessivePronounSection(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [
          NSubHeader(text: AppLocalizations.of(context)!.personalPronouns)
        ],
      ),
      PronounLine(
          pronoun: PronounEnum.I,
          text: NText([
            N.NTextSpan('Ti ideš sa '),
            N.NTextSpan('mnom', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Ja ću pjevati s '),
            N.NTextSpan('tobom', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Ja radim zajedno s '),
            N.NTextSpan('njim', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('Josip će putovati s '),
            N.NTextSpan('njom', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('Treba ti da ideš s '),
            N.NTextSpan('nama', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Ivan mora pričati s '),
            N.NTextSpan('vama', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Zoran želi ići s '),
            N.NTextSpan('njima', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.Oneself,
          text:
              NText([N.NTextSpan('Sa '), N.NTextSpan('sobom', isBold: true)])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText(
          [N.NTextSpan(AppLocalizations.of(context)!.instrumentalDescription)]),
      YouTubeLink(context, 'https://www.youtube.com/watch?v=sOX2Z70g73Q')
    ],
  );
}

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(text: AppLocalizations.of(context)!.exampleSentences),
      NText([
        N.NTextSpan('Juhu sam jeo '),
        N.NTextSpan('žlicom', isBold: true),
      ]),
      NText([
        N.NTextSpan('Na posao idem '),
        N.NTextSpan('autom', isBold: true),
      ]),
      NText([
        N.NTextSpan('Volim se baviti '),
        N.NTextSpan('sportom', isBold: true),
      ]),
      NText([
        N.NTextSpan('Razgovaram '),
        N.NTextSpan('s prijateljem', isBold: true),
      ]),
      NText([
        N.NTextSpan('Idem '),
        N.NTextSpan('sa ženom', isBold: true),
      ]),
      NText([
        N.NTextSpan('Putujem '),
        N.NTextSpan('noću', isBold: true),
      ]),
    ],
  );
}
