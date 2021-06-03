import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navika/models/constants.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class WidgetHelpers {
  static IconData getGenderIcon(GenderEnum gender) {
    if (gender == GenderEnum.Feminine) {
      return FEMINIE_ICON;
    } else if (gender == GenderEnum.Masculine) {
      return MASCULINE_ICON;
    } else {
      return NEUTER_ICON;
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

  static List<DropdownMenuItem<String>> getNounDropdownItems(Noun noun) {
    var items = noun.getUniqueDeclensions();
    return items
        .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
        .toList();
  }

  static List<DropdownMenuItem<String>> getDropdownItems(DeclinableWord word) {
    var items = word.getUniqueDeclensions();
    return items
        .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
        .toList();
  }
}
