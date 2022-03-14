import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/example-sentences.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/possessive-pronoun-section.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/dativ-lokativ-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-text-multi.dart';
import 'package:nrs_flutter_lib/widgets/n-text-span.dart';

class DativGrammarGuideContent extends StatelessWidget {
  const DativGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NTextSpan(AppLocalizations.of(context)!.dativDescription),
        ExampleSentences(
          sentences: [
            NTextMulti([
              TextSpan(text: 'On je kupio igračku '),
              TextSpan(
                  text: 'sinu',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Došao je na posao usprkos '),
              TextSpan(
                  text: 'bolesti',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: 'Dao sam '),
              TextSpan(
                  text: 'mami ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: 'čaj'),
            ]),
          ],
        ),
        DativLokativDeclensionTable(),
        PossessivePronounSection(
          contents: [
            PronounLine(
                pronoun: PronounEnum.I,
                text: NTextMulti([
                  TextSpan(text: 'Objasni '),
                  TextSpan(
                      text: 'mi ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'dativ\n'),
                  TextSpan(text: 'Objasni dativ '),
                  TextSpan(
                      text: 'meni',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: ', molim te!'),
                ])),
            PronounLine(
                pronoun: PronounEnum.You,
                text: NTextMulti([
                  TextSpan(text: 'Ja ću pokazati '),
                  TextSpan(
                      text: 'tebi ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'nešto\n'),
                  TextSpan(text: 'Ja '),
                  TextSpan(
                      text: 'ti ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'ću pokazati nešto'),
                ])),
            PronounLine(
                pronoun: PronounEnum.He,
                text: NTextMulti([
                  TextSpan(text: 'Poklonio sam knjigu '),
                  TextSpan(
                      text: 'njemu\n',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'Ja '),
                  TextSpan(
                      text: 'mu ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'nešto poklonio'),
                ])),
            PronounLine(
                pronoun: PronounEnum.She,
                text: NTextMulti([
                  TextSpan(text: 'On kazao '),
                  TextSpan(
                      text: 'njoj ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'nešto\n'),
                  TextSpan(text: 'On '),
                  TextSpan(
                      text: 'joj ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'nešto pokazao '),
                ])),
            PronounLine(
                pronoun: PronounEnum.We,
                text: NTextMulti([
                  TextSpan(text: 'Trabamo kupiti '),
                  TextSpan(
                      text: 'nama ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'auto\n'),
                  TextSpan(text: 'Pokaži '),
                  TextSpan(
                      text: 'nam ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'gdje je pekara'),
                ])),
            PronounLine(
                pronoun: PronounEnum.You_Plural,
                text: NTextMulti([
                  TextSpan(text: 'Pokažat ćemo '),
                  TextSpan(
                      text: 'vam ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'grad\n'),
                  TextSpan(text: 'Pokažat ćemo grad '),
                  TextSpan(
                      text: 'vama',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.They_Ungendered,
                text: NTextMulti([
                  TextSpan(text: 'Daj '),
                  TextSpan(
                      text: 'im ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'naše knjige\n'),
                  TextSpan(text: 'Daj naše knjige  '),
                  TextSpan(
                      text: 'njima',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
            PronounLine(
                pronoun: PronounEnum.Oneself,
                text: NTextMulti([
                  TextSpan(text: 'Napravi '),
                  TextSpan(
                      text: 'si ',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                  TextSpan(text: 'kavu\n'),
                  TextSpan(text: 'Napravi kavu '),
                  TextSpan(
                      text: 'sebi',
                      style: Nrs.getTextStyle(context: context, isBold: true)),
                ])),
          ],
        ),
      ],
    );
  }
}
