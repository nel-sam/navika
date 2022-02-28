import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/akuzativ-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-sub-header.dart';
import 'package:nrs_flutter_lib/widgets/n-text-multi.dart';
import 'package:nrs_flutter_lib/widgets/n-text-span.dart';

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(AppLocalizations.of(context)!.exampleSentences),
      NTextMulti([
        TextSpan(text: 'Volim '),
        TextSpan(
            text: 'svog psa',
            style: Nrs.getTextStyle(context: context, isBold: true)),
      ]),
      NTextMulti([
        TextSpan(text: 'Vidiš li '),
        TextSpan(
            text: 'veliku kuću',
            style: Nrs.getTextStyle(context: context, isBold: true)),
        TextSpan(text: '?'),
      ]),
      NTextMulti([
        TextSpan(text: 'Popijmo '),
        TextSpan(
            text: 'toplo mlijeko ',
            style: Nrs.getTextStyle(context: context, isBold: true)),
      ]),
    ],
  );
}

Widget getPossessivePronounSection(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [NSubHeader(AppLocalizations.of(context)!.personalPronouns)],
      ),
      PronounLine(
          pronoun: PronounEnum.I,
          text: NTextMulti([
            TextSpan(text: 'Čuješ li '),
            TextSpan(
                text: 'me?\n',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'Čuješ li '),
            TextSpan(
                text: 'mene?',
                style: Nrs.getTextStyle(context: context, isBold: true)),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NTextMulti([
            TextSpan(text: 'Volim '),
            TextSpan(
                text: 'te\n',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'Ja volim '),
            TextSpan(
                text: 'tebe',
                style: Nrs.getTextStyle(context: context, isBold: true)),
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NTextMulti([
            TextSpan(text: 'Ona '),
            TextSpan(
                text: 'ga ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'voli\n'),
            TextSpan(text: 'Ona voli '),
            TextSpan(
                text: 'njega',
                style: Nrs.getTextStyle(context: context, isBold: true)),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NTextMulti([
            TextSpan(text: 'Ja '),
            TextSpan(
                text: 'ju ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'volim\n'),
            TextSpan(text: 'Ja volim '),
            TextSpan(
                text: 'nju',
                style: Nrs.getTextStyle(context: context, isBold: true)),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NTextMulti([
            TextSpan(text: 'Oni znaju '),
            TextSpan(
                text: 'nas',
                style: Nrs.getTextStyle(context: context, isBold: true)),
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NTextMulti([
            TextSpan(text: 'Mi znamo '),
            TextSpan(
                text: 'vas',
                style: Nrs.getTextStyle(context: context, isBold: true)),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NTextMulti([
            TextSpan(text: 'Vi ne znate '),
            TextSpan(
                text: 'njih\n',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'Vi '),
            TextSpan(
                text: 'ih ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'ne znate'),
          ])),
    ],
  );
}

class AkuzativGrammarGuideContent extends StatelessWidget {
  const AkuzativGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NTextSpan(AppLocalizations.of(context)!.akuzativDescription),
        getExampleSentences(context),
        AkuzativDeclensionTable(),
        getPossessivePronounSection(context),
      ],
    );
  }
}
