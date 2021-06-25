import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar-guide/child-widgets/declension-table.dart';
import 'package:navika/widgets/shared/navika-text.dart';

class LokativDeclensionTable extends StatelessWidget {
  const LokativDeclensionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeclensionTable(
      masculineSingular: [
        NText([
          N.NTextSpan('Lijep'),
          N.NTextSpan('om\n', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('jezik'),
          N.NTextSpan('u', isItalic: true, color: MASCULINE_COLOR),
        ]),
      ],
      masculinePlural: [
        NText([
          N.NTextSpan('Lijep'),
          N.NTextSpan('im\n', isItalic: true, color: MASCULINE_COLOR),
          N.NTextSpan('jezic'),
          N.NTextSpan('ima', isItalic: true, color: MASCULINE_COLOR),
        ]),
      ],
      feminineSingular: [
        NText([
          N.NTextSpan('Moj'),
          N.NTextSpan('oj\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('i', isItalic: true, color: FEMININE_COLOR),
        ]),
      ],
      femininePlural: [
        NText([
          N.NTextSpan('Moj'),
          N.NTextSpan('im\n', isItalic: true, color: FEMININE_COLOR),
          N.NTextSpan('kuć'),
          N.NTextSpan('ama', isItalic: true, color: FEMININE_COLOR),
        ]),
      ],
      neuterSingular: [
        NText([
          N.NTextSpan('Vruč'),
          N.NTextSpan('em\n', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('mlijek'),
          N.NTextSpan('u', isItalic: true, color: NEUTER_COLOR),
        ]),
      ],
      neuterPlural: [
        NText([
          N.NTextSpan('Vruč'),
          N.NTextSpan('im\n', isItalic: true, color: NEUTER_COLOR),
          N.NTextSpan('mlijek'),
          N.NTextSpan('ima', isItalic: true, color: NEUTER_COLOR),
        ]),
      ],
    );
  }
}
