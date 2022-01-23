import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/akuzativ-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';

class AkuzativGrammarGuideContent extends StatelessWidget {
  const AkuzativGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getDescription(context),
        getExampleSentences(context),
        AkuzativDeclensionTable(),
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
            N.NTextSpan('Čuješ li'),
            N.NTextSpan('me?\n', isBold: true),
            N.NTextSpan('Čuješ li'),
            N.NTextSpan('mene?', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Volim '),
            N.NTextSpan('te\n', isBold: true),
            N.NTextSpan('Ja volim '),
            N.NTextSpan('tebe', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Ona '),
            N.NTextSpan('ga ', isBold: true),
            N.NTextSpan('voli\n'),
            N.NTextSpan('Ona voli '),
            N.NTextSpan('njega', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('Ja '),
            N.NTextSpan('ju ', isBold: true),
            N.NTextSpan('volim\n'),
            N.NTextSpan('Ja volim '),
            N.NTextSpan('nju', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('Oni znaju '),
            N.NTextSpan('nas', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Mi znamo '),
            N.NTextSpan('vas', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Vi ne znate '),
            N.NTextSpan('njih\n', isBold: true),
            N.NTextSpan('Vi '),
            N.NTextSpan('ih ', isBold: true),
            N.NTextSpan('ne znate'),
          ])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText([N.NTextSpan(AppLocalizations.of(context)!.akuzativDescription)]),
      YouTubeLink(context, RECOMMENDED_VIDEO_AKU)
    ],
  );
}

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(text: AppLocalizations.of(context)!.exampleSentences),
      NText([
        N.NTextSpan('Volim '),
        N.NTextSpan('svog psa', isBold: true),
      ]),
      NText([
        N.NTextSpan('Vidiš li '),
        N.NTextSpan('veliku kuću', isBold: true),
        N.NTextSpan('?'),
      ]),
      NText([
        N.NTextSpan('Popijmo '),
        N.NTextSpan('toplo mlijeko ', isBold: true),
      ]),
    ],
  );
}
