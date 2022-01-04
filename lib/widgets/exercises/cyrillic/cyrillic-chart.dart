import 'package:flutter/material.dart';
import 'package:navika/constants.dart';
import 'package:navika/lang_data/cyrillic-bank.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:navika/widgets/shared/navika-text.dart';
import 'package:navika/extensions.dart';

class CyrillicChart extends StatelessWidget {
  final String latinString;
  final String cyrillicString;

  const CyrillicChart(
      {Key? key, this.cyrillicString = '', this.latinString = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = createCharacterWidgets();

    return Scaffold(
        appBar: N.NavikaAppBar(
            Text(AppLocalizations.of(context)!.cyrillic,
                style: HEADER_TEXT_STYLE),
            context,
            []),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              if (this.cyrillicString.isNotEmpty || this.latinString.isNotEmpty)
                Column(
                  children: [
                    if (this.latinString.isNotEmpty)
                      NText([N.NTextSpan(this.latinString)]),
                    if (this.cyrillicString.isNotEmpty)
                      NText([N.NTextSpan(this.cyrillicString, isBold: true)]),
                  ],
                ),
              Expanded(
                child: GridView.extent(
                    maxCrossAxisExtent: 110, children: children),
              ),
            ],
          ),
        ));
  }

  bool charInHighlightString(String char) {
    if (this.cyrillicString.isEmpty) return false;
    return this.cyrillicString.containsCaseInsensitive(char);
  }

  List<Widget> createCharacterWidgets() {
    List<Widget> children = [];

    for (int i = 0; i < latinCyrillicMap.length; i++) {
      var key = latinCyrillicMap.keys.elementAt(i);
      var value = latinCyrillicMap[key]!;
      var needsHighlight = charInHighlightString(value);

      children.add(
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                NText([N.NTextSpan('${key.toUpperCase()} $key')]),
                NText([
                  N.NTextSpan('${value.toUpperCase()} $value',
                      isBold: true, fontSize: 20)
                ]),
              ],
            ),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                  color: needsHighlight ? WRONG_COLOR : ACCENT_COLOR,
                  width: needsHighlight ? 3 : 1),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      );
    }

    return children;
  }
}
