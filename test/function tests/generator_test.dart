// import 'package:flutter_test/flutter_test.dart';
// import 'package:navika/lang_data/nouns.dart';
// import 'package:navika/lang_data/sentence_bank_generator.dart';

// import 'package:navika/models/adjective.dart';
// import 'package:navika/models/enums.dart';
// import 'package:navika/models/models.dart';
// import 'package:navika/models/noun.dart';
// import 'package:navika/models/personal-pronoun.dart';
// import 'package:navika/state/content-generators/pan-generator.dart';

// void main() {
//   test('Tags are properly avoided', () async {
//     final comboCount = 1000;

//     for (int i = 0; i < comboCount; i++) {
//       final combos = PanGenerator.getPANCombos(
//           caseType: Cases.Nom,
//           bank: nounWordBank,
//           getStaticSentenceParts:
//               (Noun n, bool b, Adjective? a, Adjective? a2) =>
//                   StaticSentenceParts(),
//           getPersonalPronounSentenceStaticParts: (PersonalPronoun p, bool b) =>
//               StaticSentenceParts());

//       if (combos.adjective != null && combos.noun != null) {
//         for (var avoid in combos.adjective!.toAvoid) {
//           expect(false, combos.noun!.tags.contains(avoid));
//         }
//       }

//       if (combos.possPronoun != null && combos.noun != null) {
//         for (var avoid in combos.possPronoun!.toAvoid) {
//           expect(false, combos.noun!.tags.contains(avoid));
//         }
//       }
//     }
//   });
// }
