import 'package:flutter/foundation.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/widgets/content-generators/akuzativ-generators.dart';
import 'package:navika/widgets/content-generators/nominativ-generators.dart';
import 'package:navika/widgets/content-generators/instrumental-generators.dart';
import 'package:navika/widgets/content-generators/dativ-generators.dart';
import 'package:navika/widgets/content-generators/genetiv-generators.dart';
import 'package:navika/widgets/content-generators/lokativ-generators.dart';

class CaseExercises with ChangeNotifier {
  Map<Cases, List<QuestionStateItem>> exerciseItems = {};

  CaseExercises({Cases? caseType}) {
    switch (caseType) {
      case Cases.Nom:
        exerciseItems[Cases.Nom] =
            NominativGenerators.initializePANStateItems();
        break;
      case Cases.Aku:
        exerciseItems[Cases.Aku] = AkuzativGenerators.initializePANStateItems();
        break;
      case Cases.Ins:
        exerciseItems[Cases.Ins] =
            InstrumentalGenerators.initializePANStateItems();
        break;
      case Cases.Dat:
        exerciseItems[Cases.Dat] = DativGenerators.initializePANStateItems();
        break;
      case Cases.Lok:
        exerciseItems[Cases.Lok] = LokativGenerators.initializePANStateItems();
        break;
      case Cases.Gen:
        exerciseItems[Cases.Gen] = GenetivGenerators.initializePANStateItems();
        break;
      case Cases.Vok:
        exerciseItems[Cases.Vok] = [];
        break;
      default:
        break;
    }

    notifyListeners();
  }

  void add(Cases caseType, QuestionStateItem item) {
    exerciseItems[caseType]!.add(item);
    notifyListeners();
  }

  void modifyStateItem(
      Cases caseType, QuestionStateItem toModify, QuestionStateItem newValue) {
    toModify.combos = newValue.combos;
    toModify.isCorrect = newValue.isCorrect;
    toModify.userAdjResponse = newValue.userAdjResponse;
    toModify.userNounResponse = newValue.userNounResponse;
    toModify.userPersPronResponse = newValue.userPersPronResponse;
    toModify.userPronResponse = newValue.userPronResponse;

    notifyListeners();
  }

  List<QuestionStateItem> shuffle(Cases caseType) {
    exerciseItems[caseType]!.shuffle();
    exerciseItems[caseType]!.forEach((element) {
      element.userAdjResponse = '';
      element.userNounResponse = '';
      element.userPronResponse = '';
      element.userPersPronResponse = '';
      element.isCorrect = false;
    });

    notifyListeners();
    return exerciseItems[caseType]!;
  }
}
