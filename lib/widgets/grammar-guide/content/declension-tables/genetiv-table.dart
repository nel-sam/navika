import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class GenitivDeclensionTable extends StatelessWidget {
  const GenitivDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      note: AppLocalizations.of(context)!.softLettersOgEg,
      masculineSingular: [
        NText([
          N.NTextSpan('Lijep'),
          N.NTextSpan('og', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('**\n'),
          N.NTextSpan('jezik'),
          N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
        ]),
      ],
      masculinePlural: [
        NText([
          N.NTextSpan('Lijep'),
          N.NTextSpan('ih\n', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('jezik'),
          N.NTextSpan('a', isItalic: true, color: MASCULINE_COLOR),
        ]),
      ],
      feminineSingular: [
        NText([
          N.NTextSpan('Moj'),
          N.NTextSpan('e\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
        ]),
      ],
      femininePlural: [
        NText([
          N.NTextSpan('Moj'),
          N.NTextSpan('ih\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
        ]),
      ],
      neuterSingular: [
        NText([
          N.NTextSpan('Vruć'),
          N.NTextSpan('eg', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('**\n'),
          N.NTextSpan('mlijek'),
          N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
        ]),
      ],
      neuterPlural: [
        NText([
          N.NTextSpan('Vruć'),
          N.NTextSpan('ih\n', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('mlijek'),
          N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
        ]),
      ],
    );
  }
}
