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

  CaseExercises() {
    exerciseItems[Cases.Nom] = NominativGenerators.initializePANStateItems();
    exerciseItems[Cases.Aku] = AkuzativGenerators.initializePANStateItems();
    exerciseItems[Cases.Ins] = InstrumentalGenerators.initializePANStateItems();
    exerciseItems[Cases.Dat] = DativGenerators.initializePANStateItems();
    exerciseItems[Cases.Lok] = LokativGenerators.initializePANStateItems();
    exerciseItems[Cases.Gen] = GenetivGenerators.initializePANStateItems();
    exerciseItems[Cases.Vok] = [];
    notifyListeners();
  }

  void add(Cases caseType, QuestionStateItem item) {
    exerciseItems[caseType]!.add(item);
    notifyListeners();
  }

  void modifyStateItem(
      Cases caseType, QuestionStateItem stateItem, QuestionStateItem newValue) {
    var toModify = exerciseItems[caseType]!.firstWhere((e) => e == stateItem);
    toModify = newValue;
    notifyListeners();
  }
}
