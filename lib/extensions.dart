import 'dart:math';

import 'package:navika/models/models.dart';

extension ExtendedText on List<String> {
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

extension ExtendedPAN on List<PANExerciseItem> {
  List<PANExerciseItem> shufflePAN() {
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
