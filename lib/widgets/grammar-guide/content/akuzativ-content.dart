import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/youtube-link.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/navika-subheader.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/pronoun-line.dart';

// ignore: non_constant_identifier_names
Widget AkuzativGrammarGuideContent(BuildContext context) {
  return Column(
    children: [
      getDescription(context),
      getDeclensionTable(context),
      getPronounSection(context),
    ],
  );
}

Widget getDeclensionTable(BuildContext context) {
  return DeclensionTable(
    showSameAsNomNote: true,
    note: AppLocalizations.of(context)!.animateAkuzativ,
    masculineSingular: [
      NText([
        N.NTextSpan('Star'),
        N.NTextSpan('og\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('prijatelj'),
        N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('**\n'),
      ]),
    ],
    masculinePlural: [
      NText([
        N.NTextSpan('Star'),
        N.NTextSpan('e\n', isItalic: true, color: MASCULINE_COLOR),
        N.NTextSpan('prijatel'),
        N.NTextSpan('e', isItalic: true, color: MASCULINE_COLOR),
      ]),
    ],
    feminineSingular: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('u\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('u', isItalic: true, color: FEMININE_COLOR),
      ]),
    ],
    femininePlural: [
      NText([
        N.NTextSpan('Moj'),
        N.NTextSpan('e\n', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('kuć'),
        N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
        N.NTextSpan('*'),
      ]),
    ],
    neuterSingular: [
      NText([
        N.NTextSpan('Topl'),
        N.NTextSpan('o\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('o', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('*'),
      ]),
    ],
    neuterPlural: [
      NText([
        N.NTextSpan('Topl'),
        N.NTextSpan('a\n', isItalic: true, color: NEUTER_COLOR),
        N.NTextSpan('mlijek'),
        N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
      ]),
    ],
  );
}

Widget getPronounSection(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [NSubHeader(text: AppLocalizations.of(context)!.pronouns)],
      ),
      PronounLine(
          pronoun: PronounEnum.I,
          text: NText([
            N.NTextSpan('Da li '),
            N.NTextSpan('me ', isBold: true),
            N.NTextSpan('čuješ?\n'),
            N.NTextSpan('Da li čuješ '),
            N.NTextSpan('mene', isBold: true),
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
      YouTubeLink(context, 'https://www.youtube.com/watch?v=MaDzMpCP34A')
    ],
  );
}
