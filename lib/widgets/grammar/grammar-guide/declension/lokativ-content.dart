import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/dativ-lokativ-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';

class LokativGrammarGuideContent extends StatelessWidget {
  const LokativGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getDescription(context),
        getExampleSentences(context),
        DativLokativDeclensionTable(),
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
            N.NTextSpan('Ova knjiga je o '),
            N.NTextSpan('meni', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Ja mislim o '),
            N.NTextSpan('tebi', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Ona se brini o '),
            N.NTextSpan('njemu', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('On samo priča o '),
            N.NTextSpan('njoj', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('Ona kaže nešto o '),
            N.NTextSpan('nama', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Ja ne znam ništa o '),
            N.NTextSpan('vama', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Hoćemo govoriti o '),
            N.NTextSpan('njima', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.Oneself,
          text: NText([
            N.NTextSpan('I o '),
            N.NTextSpan('sebi ', isBold: true),
            N.NTextSpan('isto'),
          ])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText([N.NTextSpan(AppLocalizations.of(context)!.lokativDescription)]),
      YouTubeLink(context, 'https://www.youtube.com/watch?v=w1g5IV6cbY8')
    ],
  );
}

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(text: AppLocalizations.of(context)!.exampleSentences),
      NText([
        N.NTextSpan('Ova priča govori '),
        N.NTextSpan('o njemu', isBold: true),
      ]),
      NText([
        N.NTextSpan('On gleda film '),
        N.NTextSpan('u kinu', isBold: true),
      ]),
      NText([
        N.NTextSpan('Živim '),
        N.NTextSpan('u gradu', isBold: true),
      ]),
      NText([
        N.NTextSpan('U kuhinji ', isBold: true),
        N.NTextSpan('ima mnogo'),
      ]),
      NText([
        N.NTextSpan('Idemo ', isBold: true),
        N.NTextSpan('na ručak'),
      ]),
    ],
  );
}
