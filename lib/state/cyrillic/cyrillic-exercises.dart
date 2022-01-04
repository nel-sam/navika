import 'package:flutter/material.dart';
import 'package:navika/lang_data/cyrillic-bank.dart';
import 'package:navika/state/cyrillic/cyrillic-state-item.dart';

class CyrillicBankItem {
  final String latinString;
  final String cyrillicString;
  final String Function(BuildContext) getTranslation;

  CyrillicBankItem({
    required this.latinString,
    required this.cyrillicString,
    required this.getTranslation,
  });
}

class CyrillicExercises with ChangeNotifier {
  late List<CyrillicStateItem> exerciseItems;

  CyrillicExercises() {
    exerciseItems = cyrillicWordBank
        .map((e) => CyrillicStateItem(
              latinString: e.latinString,
              cyrillicString: e.cyrillicString,
              getTranslation: e.getTranslation,
              notifyListeners: notifyListeners,
            ))
        .toList();

    exerciseItems.shuffle();
  }
}
