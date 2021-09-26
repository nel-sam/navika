import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/dativ-lokativ-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';

class DativGrammarGuideContent extends StatelessWidget {
  const DativGrammarGuideContent({Key? key}) : super(key: key);

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
            N.NTextSpan('Objasni '),
            N.NTextSpan('mi ', isBold: true),
            N.NTextSpan('dativ\n'),
            N.NTextSpan('Objasni dativ '),
            N.NTextSpan('meni', isBold: true),
            N.NTextSpan(', molim te!'),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NText([
            N.NTextSpan('Ja ću pokazati '),
            N.NTextSpan('tebi ', isBold: true),
            N.NTextSpan('nešto\n'),
            N.NTextSpan('Ja '),
            N.NTextSpan('ti ', isBold: true),
            N.NTextSpan('ću pokazati nešto'),
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NText([
            N.NTextSpan('Poklonio sam knjigu '),
            N.NTextSpan('njemu\n', isBold: true),
            N.NTextSpan('Ja '),
            N.NTextSpan('mu ', isBold: true),
            N.NTextSpan('nešto poklonio'),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NText([
            N.NTextSpan('On kazao '),
            N.NTextSpan('njoj ', isBold: true),
            N.NTextSpan('nešto\n'),
            N.NTextSpan('On '),
            N.NTextSpan('joj ', isBold: true),
            N.NTextSpan('nešto pokazao '),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NText([
            N.NTextSpan('Trabamo kupiti '),
            N.NTextSpan('nama ', isBold: true),
            N.NTextSpan('auto\n'),
            N.NTextSpan('Pokaži '),
            N.NTextSpan('nam ', isBold: true),
            N.NTextSpan('gdje je pekara'),
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NText([
            N.NTextSpan('Pokažat ćemo '),
            N.NTextSpan('vam ', isBold: true),
            N.NTextSpan('grad\n'),
            N.NTextSpan('Pokažat ćemo grad '),
            N.NTextSpan('vama', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NText([
            N.NTextSpan('Daj '),
            N.NTextSpan('im ', isBold: true),
            N.NTextSpan('naše knjige\n'),
            N.NTextSpan('Daj naše knjige  '),
            N.NTextSpan('njima', isBold: true),
          ])),
      PronounLine(
          pronoun: PronounEnum.Oneself,
          text: NText([
            N.NTextSpan('Napravi '),
            N.NTextSpan('si ', isBold: true),
            N.NTextSpan('kavu\n'),
            N.NTextSpan('Napravi kavu '),
            N.NTextSpan('sebi', isBold: true),
          ])),
    ],
  );
}

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NText([N.NTextSpan(AppLocalizations.of(context)!.dativDescription)])
    ],
  );
}

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(text: AppLocalizations.of(context)!.exampleSentences),
      NText([
        N.NTextSpan('On je kupio igračku '),
        N.NTextSpan('sinu', isBold: true),
      ]),
      NText([
        N.NTextSpan('Došao je na posao usprkos '),
        N.NTextSpan('bolesti', isBold: true),
      ]),
      NText([
        N.NTextSpan('Dao sam '),
        N.NTextSpan('mami ', isBold: true),
        N.NTextSpan('čaj'),
      ]),
    ],
  );
}
