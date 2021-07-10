import 'package:flutter/foundation.dart';
import 'package:navika/lang_data/word-bank.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';
import 'package:navika/widgets/content-generators/nominativ-generators.dart';

class CaseExercises with ChangeNotifier {
  Map<Cases, List<QuestionStateItem>> exerciseItems = {};

  CaseExercises() {

    exerciseItems[Cases.Nom] = NominativGenerators.initializePANStateItems();
    exerciseItems[Cases.Aku] = List<QuestionStateItem>.empty(growable: true);
    exerciseItems[Cases.Ins] = List<QuestionStateItem>.empty(growable: true);
    exerciseItems[Cases.Dat] = List<QuestionStateItem>.empty(growable: true);
    exerciseItems[Cases.Lok] = List<QuestionStateItem>.empty(growable: true);
    exerciseItems[Cases.Gen] = List<QuestionStateItem>.empty(growable: true);
    exerciseItems[Cases.Vok] = List<QuestionStateItem>.empty(growable: true);
  }

  void add(Cases caseType, QuestionStateItem item) {
    exerciseItems[caseType]!.add(item);
    notifyListeners();
  }
}
