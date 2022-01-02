import 'package:flutter/foundation.dart';
import 'package:navika/state/cyrillic/cyrillic-state-item.dart';

class CyrillicBankItem {}

class CyrillicExercises with ChangeNotifier {
  late List<CyrillicStateItem> exerciseItems;

  CyrillicExercises() {
    List<CyrillicBankItem> cyrillicWordBank = [];

    exerciseItems = cyrillicWordBank
        .map((text) => CyrillicStateItem(
              //cyrillic: text,
              notifyListeners: notifyListeners,
            ))
        .toList();

    exerciseItems.shuffle();
  }
}
