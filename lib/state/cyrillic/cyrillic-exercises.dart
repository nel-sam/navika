import 'package:flutter/foundation.dart';
import 'package:navika/state/cyrillic/cyrillic-state-item.dart';

class CyrillicBankItem {
  final String latinString;
  final String cyrillicString;

  CyrillicBankItem(this.latinString, this.cyrillicString);
}

class CyrillicExercises with ChangeNotifier {
  late List<CyrillicStateItem> exerciseItems;

  CyrillicExercises() {
    List<CyrillicBankItem> cyrillicWordBank = [
      CyrillicBankItem('Pada kiša Danas', 'Пада киша Данас'),
      CyrillicBankItem('Ovo je najbolji cevapi', 'Ово је најбољи цевапи '),
    ];

    exerciseItems = cyrillicWordBank
        .map((e) => CyrillicStateItem(
              latinString: e.latinString,
              cyrillicString: e.cyrillicString,
              notifyListeners: notifyListeners,
            ))
        .toList();

    exerciseItems.shuffle();
  }
}
