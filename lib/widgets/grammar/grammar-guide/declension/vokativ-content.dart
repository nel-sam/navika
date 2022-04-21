import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/grammar/grammar-guide/child-widgets/example-sentences.dart';
import 'package:navika/widgets/grammar/grammar-guide/declension/declension_tables/vokativ-table.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_text_multi.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class VokativGrammarGuideContent extends StatelessWidget {
  final DialectType dialect;

  const VokativGrammarGuideContent({
    Key? key,
    required this.dialect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSerbian = dialect == DialectType.Ekavian;

    return Column(
      children: [
        NTextSpan(N.t('vokativDescription')),
        ExampleSentences(
          sentences: [
            NTextMulti([
              TextSpan(text: 'Hej, '),
              TextSpan(
                  text: 'Ivane! ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: '(nom. Ivan)'),
            ]),
            NTextMulti([
              TextSpan(
                  text: 'Profesore! ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: 'Imam pitanje'),
            ]),
            NTextMulti([
              TextSpan(
                  text: 'Sestro moja, ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: 'kako si?'),
            ]),
            NTextMulti([
              TextSpan(text: 'Dobar dan, '),
              TextSpan(
                  text: 'gospođo.',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(text: isSerbian ? 'Gde ideš, ' : 'Gdje ideš, '),
              TextSpan(
                  text: 'Ana?',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
            ]),
            NTextMulti([
              TextSpan(
                  text: 'Gospodine, ',
                  style: Nrs.getTextStyle(context: context, isBold: true)),
              TextSpan(text: 'sve dobro?'),
            ]),
          ],
        ),
        VokativDeclensionTable()
      ],
    );
  }
}
