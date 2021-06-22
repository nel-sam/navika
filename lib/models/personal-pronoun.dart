import 'dart:math';

import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/utilities/navika-helpers.dart';

class PersonalPronoun {
  final PronounEnum type;
  final bool isPlural;
  final Genders gender;
  final String dictionary;

  final DeclensionPronoun nominativ;
  final DeclensionPronoun akuzativ;
  final DeclensionPronoun instrumental;
  final DeclensionPronoun lokativ;
  final DeclensionPronoun dativ;
  final DeclensionPronoun genitiv;
  final DeclensionPronoun vokativ;

  PersonalPronoun({
    required this.type,
    required this.isPlural,
    required this.dictionary,
    required this.gender,
    required this.nominativ,
    required this.akuzativ,
    required this.instrumental,
    required this.lokativ,
    required this.dativ,
    required this.genitiv,
    required this.vokativ,
  });

  String getDeclension(
      {required CaseTypeEnum caseType, required bool isShortForm}) {
    DeclensionPronoun declension;

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

    return isShortForm ? declension.shortForm : declension.general;
  }

  String getRandomDeclension(String avoid) {
    final declensions = getUniqueDeclensions();
    declensions.remove(avoid);
    final random = new Random();
    var index = random.nextInt(declensions.length - 1);
    return declensions[index];
  }

  List<String> getUniqueDeclensions() {
    return N.shuffleList([
      this.dictionary,
      this.nominativ.general,
      this.akuzativ.general,
      this.instrumental.general,
      this.lokativ.general,
      this.dativ.general,
      this.genitiv.general,
      this.vokativ.general,
      this.nominativ.shortForm,
      this.akuzativ.shortForm,
      this.instrumental.shortForm,
      this.lokativ.shortForm,
      this.dativ.shortForm,
      this.genitiv.shortForm,
      this.vokativ.shortForm,
    ].toSet().toList().where((element) => element.length > 0).toList());
  }
}
