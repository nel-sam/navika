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
    List<QuestionStateItem> items = [];

    switch (caseType) {
      case Cases.Nom:
        items = NominativGenerators.initializePANStateItems();
        break;
      case Cases.Aku:
        items = AkuzativGenerators.initializePANStateItems();
        break;
      case Cases.Ins:
        items = InstrumentalGenerators.initializePANStateItems();
        break;
      case Cases.Dat:
        items = DativGenerators.initializePANStateItems();
        break;
      case Cases.Lok:
        items = LokativGenerators.initializePANStateItems();
        break;
      case Cases.Gen:
        items = GenetivGenerators.initializePANStateItems();
        break;
      case Cases.Vok:
        items = [];
        break;
      default:
        break;
    }

    if (caseType != null) {
      exerciseItems[caseType] = items;
      exerciseItems[caseType]!.shuffle();
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
    toModify.userPossPronResponse = newValue.userPossPronResponse;

    notifyListeners();
  }

  List<QuestionStateItem> shuffleAndClear(
      {required Cases caseType, bool notify: true}) {
    exerciseItems[caseType]!.shuffle();
    exerciseItems[caseType]!.forEach((element) {
      element.userAdjResponse = '';
      element.userNounResponse = '';
      element.userPossPronResponse = '';
      element.userPersPronResponse = '';
      element.isCorrect = false;
    });

    if (notify) notifyListeners();
    return exerciseItems[caseType]!;
  }
}
