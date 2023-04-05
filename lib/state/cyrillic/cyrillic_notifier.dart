import 'package:flutter/material.dart';
import 'package:navika/lang_data/cyrillic_bank.dart';
import 'package:navika/state/cyrillic/cyrillic_state_item.dart';

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

class CyrillicNotifier with ChangeNotifier {
  late List<CyrillicStateItem> exerciseItems;

  CyrillicNotifier() {
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
