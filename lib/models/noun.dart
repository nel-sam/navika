import 'dart:math';

import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';

class Noun {
  final List<Tags> tags;
  final Genders gender;
  final String dictionary;
  final bool isAnimate;

  final DeclensionByCount nominativ;
  final DeclensionByCount akuzativ;
  final DeclensionByCount instrumental;
  final DeclensionByCount lokativ;
  final DeclensionByCount dativ;
  final DeclensionByCount genitiv;
  final DeclensionByCount vokativ;

  Noun({
    required this.tags,
    required this.dictionary,
    required this.gender,
    required this.isAnimate,
    required this.nominativ,
    required this.akuzativ,
    required this.instrumental,
    required this.lokativ,
    required this.dativ,
    required this.genitiv,
    required this.vokativ,
  });

  List<String> getDeclensions(bool isPlural, CaseTypeEnum caseType) {
    DeclensionByCount declension;

    switch (caseType) {
      case CaseTypeEnum.Akuzativ:
        declension = this.akuzativ;
        break;
      case CaseTypeEnum.Dativ:
        declension = this.dativ;
        break;
      case CaseTypeEnum.Genitiv:
        declension = this.genitiv;
        break;
      case CaseTypeEnum.Instrumental:
        declension = this.instrumental;
        break;
      case CaseTypeEnum.Lokativ:
        declension = this.lokativ;
        break;
      case CaseTypeEnum.Nominativ:
        declension = this.nominativ;
        break;
      case CaseTypeEnum.Vokativ:
        declension = this.vokativ;
        break;
    }

    return isPlural ? declension.plural : declension.singular;
  }

  String getRandomDeclension(List<String> avoid) {
    final declensions = getUniqueDeclensions();
    declensions.removeWhere((d) => avoid.contains(d));
    final random = new Random();
    var index = random.nextInt(declensions.length - 1);
    return declensions[index];
  }

  List<String> getUniqueDeclensions() {
    return N.shuffleList([
      this.dictionary,
      ...this.nominativ.singular,
      ...this.akuzativ.singular,
      ...this.instrumental.singular,
      ...this.lokativ.singular,
      ...this.dativ.singular,
      ...this.genitiv.singular,
      ...this.vokativ.singular,
      ...this.nominativ.plural,
      ...this.akuzativ.plural,
      ...this.instrumental.plural,
      ...this.lokativ.plural,
      ...this.dativ.plural,
      ...this.genitiv.plural,
      ...this.vokativ.plural,
    ].toSet().toList().where((element) => element.length > 0).toList());
  }
}
