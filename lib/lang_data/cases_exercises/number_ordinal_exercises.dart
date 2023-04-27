// TODO: NumberOrdinalExercises

import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class NumberOrdinalExercises {
  final DialectType dialect;
  late bool isSerbian;

  NumberOrdinalExercises({required this.dialect}) {
    this.isSerbian = dialect == DialectType.Serbia;
  }

  // TODO: Add ordinal number exercises
  List<PANCombo> get general => [];
}
