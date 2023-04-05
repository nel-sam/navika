import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navika/lang_data/words/demonstrative_pronouns.dart';
import 'package:navika/lang_data/words/nouns.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika_helpers.dart';
import 'package:nrs_flutter_lib/enums.dart';

void main() {
  test('N.getBitiConjugation() returns correct conjugation', () async {
    expect(N.getBitiConjugation('ja'), 'sam');
    expect(N.getBitiConjugation('ti'), 'si');
    expect(N.getBitiConjugation('on'), 'je');
    expect(N.getBitiConjugation('ona'), 'je');
    expect(N.getBitiConjugation('ono'), 'je');
    expect(N.getBitiConjugation('mi'), 'smo');
    expect(N.getBitiConjugation('vi'), 'ste');
    expect(N.getBitiConjugation('oni'), 'su');
    expect(N.getBitiConjugation('one'), 'su');
  });

  // test('N.filterByExerciseType() correctly filters', () async {
  //   var combo = DativExercises(DialectType.Croatia).general.first;

  //   expect();
  // });

  testWidgets('N.getCorrectSentence() returns correct sentence',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          var sentenceParts = [
            CaseSentencePart(
              isCorrectable: true,
              actualObject: DemonstrativePronouns.koji,
              displayValue: DemonstrativePronouns.koji.dictionary,
              correctValues:
                  DemonstrativePronouns.koji.dativ!.masculine.singular,
              grammarType: GrammarTypes.demonstrativePronoun,
            ),
            CaseSentencePart(
              isCorrectable: true,
              actualObject: NounBankGeneral.pas,
              displayValue: NounBankGeneral.pas.dictionary,
              correctValues: NounBankGeneral.pas.dativ!.singular,
              grammarType: GrammarTypes.noun,
            ),
            CaseSentencePart(displayValue: 'da dam igračku?'),
          ];

          expect(N.getCorrectSentence(context, sentenceParts),
              'Kojem psu da dam igračku?');

          return Placeholder();
        },
      ),
    );
  });
}
