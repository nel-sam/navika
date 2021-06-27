import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class NominativDeclensionTable extends StatelessWidget {
  const NominativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      masculineSingular: [
        NText([
          N.NTextSpan('Lijep'),
          N.NTextSpan('i\n', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('jezi'),
          N.NTextSpan('k', isItalic: true, color: MASCULINE_COLOR),
        ]),
      ],
      masculinePlural: [
        NText([
          N.NTextSpan('Lijep'),
          N.NTextSpan('i\n', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('jezic'),
          N.NTextSpan('i', isItalic: true, color: MASCULINE_COLOR),
        ]),
      ],
      feminineSingular: [
        NText([
          N.NTextSpan('Moj'),
          N.NTextSpan('a\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('a', isItalic: true, color: FEMININE_COLOR),
        ]),
      ],
      femininePlural: [
        NText([
          N.NTextSpan('Moj'),
          N.NTextSpan('e\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('e', isItalic: true, color: FEMININE_COLOR),
        ]),
      ],
      neuterSingular: [
        NText([
          N.NTextSpan('Vruć'),
          N.NTextSpan('e\n', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('mlijek'),
          N.NTextSpan('o', isItalic: true, color: NEUTER_COLOR),
        ]),
      ],
      neuterPlural: [
        NText([
          N.NTextSpan('Vruć'),
          N.NTextSpan('a\n', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('mlijek'),
          N.NTextSpan('a', isItalic: true, color: NEUTER_COLOR),
        ]),
      ],
    );
  }
}
