import 'package:flutter/foundation.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/state/cases/case-question-state-item.dart';
import 'package:navika/widgets/content-generators/akuzativ-generators.dart';
import 'package:navika/widgets/content-generators/nominativ-generators.dart';
import 'package:navika/widgets/content-generators/instrumental-generators.dart';
import 'package:navika/widgets/content-generators/dativ-generators.dart';
import 'package:navika/widgets/content-generators/genetiv-generators.dart';
import 'package:navika/widgets/content-generators/lokativ-generators.dart';
import 'package:navika/widgets/content-generators/vokativ-generators.dart';

class CaseExercises with ChangeNotifier {
  Map<Cases, List<CaseQuestionStateItem>> exerciseItems = {};

  CaseExercises({Cases? caseType}) {
    if (caseType == null) return;

    List<CaseQuestionStateItem> items = getItems(caseType);
    exerciseItems[caseType] = items;

    notifyListeners();
  }

  List<CaseQuestionStateItem> getItems(Cases caseType) {
    List<CaseQuestionStateItem> items = [];

    switch (caseType) {
      case Cases.All:
        items = NominativGenerators.initializePANStateItems();
        items.addAll(AkuzativGenerators.initializePANStateItems());
        items.addAll(InstrumentalGenerators.initializePANStateItems());
        items.addAll(DativGenerators.initializePANStateItems());
        items.addAll(LokativGenerators.initializePANStateItems());
        items.addAll(GenetivGenerators.initializePANStateItems());
        items.addAll(VokativGenerators.initializePANStateItems());
        break;
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
        items = VokativGenerators.initializePANStateItems();
        break;
      default:
        break;
    }

    items.shuffle();
    return items;
  }

  void add(Cases caseType, CaseQuestionStateItem item) {
    exerciseItems[caseType]!.add(item);
    notifyListeners();
  }

  void modifyStateItem(Cases caseType, CaseQuestionStateItem toModify,
      CaseQuestionStateItem newValue) {
    toModify.combos = newValue.combos;
    toModify.isCorrect = newValue.isCorrect;
    toModify.userAdjResponse = newValue.userAdjResponse;
    toModify.userNounResponse = newValue.userNounResponse;
    toModify.userPersPronResponse = newValue.userPersPronResponse;
    toModify.userPossPronResponse = newValue.userPossPronResponse;

    notifyListeners();
  }

  List<CaseQuestionStateItem> shuffleAndClear(
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
