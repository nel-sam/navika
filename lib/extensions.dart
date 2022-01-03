import 'dart:math';

import 'package:navika/models/models.dart';

extension ExtendedString on String {
  bool equalsCaseInsensitive(String toCheck) {
    return this.toLowerCase() == toCheck.toLowerCase();
  }

  bool containsCaseInsensitive(String toCheck) {
    return this.toLowerCase().contains(toCheck.toLowerCase());
  }
}

extension ExtendedStringList on List<String> {
  bool containsCaseInsensitive(String toCheck) {
    return this.map((e) => e.toLowerCase()).contains(toCheck.toLowerCase());
  }

  bool containsSubCaseInsensitive(String toCheck) {
    var lowered = this.map((e) => e.toLowerCase()).toList();

    for (int i = 0; i < lowered.length; i++) {
      if (lowered[i].contains(toCheck.toLowerCase())) {
        return true;
      }
    }

    return false;
  }

  List<String> removeList(List<String> toRemove) {
    List<String> result = [...this];

    for (int i = 0; i < result.length; i++) {
      if (toRemove.contains(result[i])) {
        result.removeAt(i);
      }
    }

    return result;
  }

  List<String> shuffleStrings() {
    var random = new Random();
    var items = [...this];

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }
}

extension ExtendedPAN on List<PANCombo> {
  List<PANCombo> shufflePAN() {
    var random = new Random();

    for (var i = this.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = this[i];
      this[i] = this[n];
      this[n] = temp;
    }

    return this;
  }
}
