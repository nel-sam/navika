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
}
