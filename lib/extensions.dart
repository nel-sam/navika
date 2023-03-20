import 'dart:math';

import 'package:navika/models/models.dart';

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

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
