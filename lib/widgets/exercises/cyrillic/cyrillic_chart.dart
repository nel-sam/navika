import 'package:flutter/material.dart';
import 'package:navika/lang_data/cyrillic_bank.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:navika/widgets/sbc_labels.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/extensions.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class CyrillicChart extends StatelessWidget {
  final String latinString;
  final String cyrillicString;

  const CyrillicChart(
      {Key? key, this.cyrillicString = '', this.latinString = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = createCharacterWidgets(context);

    return Scaffold(
        appBar: N.navAppBar(
          title: SbcLabels.cyrillic,
          transTitle: N.t('cyrillic'),
          context: context,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              if (this.cyrillicString.isNotEmpty || this.latinString.isNotEmpty)
                Column(
                  children: [
                    if (this.latinString.isNotEmpty)
                      NTextSpan(this.latinString),
                    if (this.cyrillicString.isNotEmpty)
                      NTextSpan(
                        this.cyrillicString,
                        textStyle:
                            Nrs.getTextStyle(context: context, isBold: true),
                      ),
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

  List<Widget> createCharacterWidgets(BuildContext context) {
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
                NTextSpan('${key.toUpperCase()} $key'),
                NTextSpan(
                  '${value.toUpperCase()} $value',
                  textStyle: Nrs.getTextStyle(
                      context: context, isBold: true, fontSize: 20),
                ),
              ],
            ),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                  color: needsHighlight
                      ? WRONG_COLOR
                      : Theme.of(context).colorScheme.primary,
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
