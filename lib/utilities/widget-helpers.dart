import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/models/models.dart';

class WidgetHelpers {
  static IconData getGenderIcon(GenderEnum gender) {
    if (gender == GenderEnum.Feminine) {
      return Icons.female;
    } else if (gender == GenderEnum.Masculine) {
      return Icons.male;
    } else {
      return Icons.hide_source_outlined;
    }
  }

  static List shuffleList(List items) {
    var random = new Random();

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }
}
