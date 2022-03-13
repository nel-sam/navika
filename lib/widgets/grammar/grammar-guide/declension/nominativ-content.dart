import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/pronoun-line.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension-tables/nominativ-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-sub-header.dart';
import 'package:nrs_flutter_lib/widgets/n-text-multi.dart';

Widget getDescription(BuildContext context) {
  return Column(
    children: [
      NTextMulti(
          [TextSpan(text: AppLocalizations.of(context)!.nominativDescription)]),
      YouTubeLink(RECOMMENDED_VIDEO_NOM)
    ],
  );
}

Widget getExampleSentences(BuildContext context) {
  return Column(
    children: [
      NSubHeader(AppLocalizations.of(context)!.exampleSentences),
      NTextMulti([
        TextSpan(
            text: 'Ja ',
            style: Nrs.getTextStyle(context: context, isBold: true)),
        TextSpan(text: 'sam '),
        TextSpan(
            text: 'Denis',
            style: Nrs.getTextStyle(context: context, isBold: true)),
      ]),
      NTextMulti([
        TextSpan(text: 'Moja '),
        TextSpan(
            text: 'žena ',
            style: Nrs.getTextStyle(context: context, isBold: true)),
        TextSpan(text: 'je '),
        TextSpan(
            text: 'učiteljica',
            style: Nrs.getTextStyle(context: context, isBold: true)),
      ]),
      NTextMulti([
        TextSpan(
            text: 'Bijelo ',
            style: Nrs.getTextStyle(context: context, isBold: true)),
        TextSpan(text: 'kao '),
        TextSpan(
            text: 'mlijeko',
            style: Nrs.getTextStyle(context: context, isBold: true)),
      ]),
      NTextMulti([
        TextSpan(
            text: 'Mlijeko ',
            style: Nrs.getTextStyle(context: context, isBold: true)),
        TextSpan(text: 'je ukusnije nego '),
        TextSpan(
            text: 'limunada',
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
            TextSpan(
                text: 'Ja ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'sam Azat'),
          ])),
      PronounLine(
          pronoun: PronounEnum.You,
          text: NTextMulti([
            TextSpan(text: 'Tko si '),
            TextSpan(
                text: 'ti',
                style: Nrs.getTextStyle(context: context, isBold: true)),
          ])),
      PronounLine(
          pronoun: PronounEnum.He,
          text: NTextMulti([
            TextSpan(text: 'Trčim brže nego '),
            TextSpan(
                text: 'on ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'i ti'),
          ])),
      PronounLine(
          pronoun: PronounEnum.She,
          text: NTextMulti([
            TextSpan(
                text: 'Ona ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'uči hrvatski'),
          ])),
      PronounLine(
          pronoun: PronounEnum.We,
          text: NTextMulti([
            TextSpan(
                text: 'Mi ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'plivamo skoro kao vi'),
          ])),
      PronounLine(
          pronoun: PronounEnum.You_Plural,
          text: NTextMulti([
            TextSpan(text: 'Govorite li '),
            TextSpan(
                text: 'vi ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'Engleski?'),
          ])),
      PronounLine(
          pronoun: PronounEnum.They_Ungendered,
          text: NTextMulti([
            TextSpan(
                text: 'Oni ',
                style: Nrs.getTextStyle(context: context, isBold: true)),
            TextSpan(text: 'plivaju u moru'),
          ])),
    ],
  );
}

class NominativGrammarGuideContent extends StatelessWidget {
  const NominativGrammarGuideContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getDescription(context),
        getExampleSentences(context),
        NominativDeclensionTable(),
        getPossessivePronounSection(context),
      ],
    );
  }
}
