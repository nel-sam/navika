import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/instrumental-table.dart';
import 'package:navika/widgets/shared/navika-text-multi.dart';
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
          text: NTextMulti([
            N.NTextSpan('Ti ideš sa '),
            N.NTextSpan('mnom', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NTextMulti([
            N.NTextSpan('Ja ću pjevati s '),
            N.NTextSpan('tobom', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NTextMulti([
            N.NTextSpan('Ja radim zajedno s '),
            N.NTextSpan('njim', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NTextMulti([
            N.NTextSpan('Josip će putovati s '),
            N.NTextSpan('njom', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NTextMulti([
            N.NTextSpan('Treba ti da ideš s '),
            N.NTextSpan('nama', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NTextMulti([
            N.NTextSpan('Ivan mora pričati s '),
            N.NTextSpan('vama', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NTextMulti([
            N.NTextSpan('Zoran želi ići s '),
            N.NTextSpan('njima', isBold: true)
          ])),
      PronounLine(
          pronoun: PronounEnum.Oneself,
          text:
              NTextMulti([N.NTextSpan('Sa '), N.NTextSpan('sobom', isBold: true)])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NTextMulti(
          [N.NTextSpan(AppLocalizations.of(context)!.instrumentalDescription)]),
      YouTubeLink(context, RECOMMENDED_VIDEO_INST)
    ],
  );
}

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(text: AppLocalizations.of(context)!.exampleSentences),
      NTextMulti([
        N.NTextSpan('Juhu sam jeo '),
        N.NTextSpan('žlicom', isBold: true),
      ]),
      NTextMulti([
        N.NTextSpan('Na posao idem '),
        N.NTextSpan('autom', isBold: true),
      ]),
      NTextMulti([
        N.NTextSpan('Volim se baviti '),
        N.NTextSpan('sportom', isBold: true),
      ]),
      NTextMulti([
        N.NTextSpan('Razgovaram '),
        N.NTextSpan('s prijateljem', isBold: true),
      ]),
      NTextMulti([
        N.NTextSpan('Idem '),
        N.NTextSpan('sa ženom', isBold: true),
      ]),
      NTextMulti([
        N.NTextSpan('Putujem '),
        N.NTextSpan('noću', isBold: true),
      ]),
    ],
  );
}
