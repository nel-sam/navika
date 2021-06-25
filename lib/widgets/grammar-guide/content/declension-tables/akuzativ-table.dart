import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class AkuzativDeclensionTable extends StatelessWidget {
  const AkuzativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      borderedItemNote: AppLocalizations.of(context)!.sameAsNom,
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
        NText(
          [
            N.NTextSpan('Moj'),
            N.NTextSpan('e\n', isItalic: true, color: FEMININE_COLOR),
            N.NTextSpan('kuć'),
            N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
          ],
          showborder: true,
        ),
      ],
      neuterSingular: [
        NText(
          [
            N.NTextSpan('Topl'),
            N.NTextSpan('o\n', isItalic: true, color: NEUTER_COLOR),
            N.NTextSpan('mlijek'),
            N.NTextSpan('o', isItalic: true, color: NEUTER_COLOR),
          ],
          showborder: true,
        ),
      ],
      neuterPlural: [
        NText(
          [
            N.NTextSpan('Topl'),
            N.NTextSpan('a\n', isItalic: true, color: NEUTER_COLOR),
            N.NTextSpan('mlijek'),
            N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
          ],
          showborder: true,
        ),
      ],
    );
  }
}
