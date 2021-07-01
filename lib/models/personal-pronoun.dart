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

  List<String> getDeclensions({required CaseTypeEnum caseType}) {
    switch (caseType) {
      case CaseTypeEnum.Akuzativ:
        return this.akuzativ.forms;
      case CaseTypeEnum.Dativ:
        return this.dativ.forms;
      case CaseTypeEnum.Genitiv:
        return this.genitiv.forms;
      case CaseTypeEnum.Instrumental:
        return this.instrumental.forms;
      case CaseTypeEnum.Lokativ:
        return this.lokativ.forms;
      case CaseTypeEnum.Nominativ:
        return this.nominativ.forms;
      case CaseTypeEnum.Vokativ:
        return this.vokativ.forms;
    }
  }

  String getRandomDeclension(List<String> avoid) {
    final List<String> declensions = getUniqueDeclensions();
    declensions.removeWhere((d) => avoid.contains(d));

    final random = new Random();
    var index = random.nextInt(declensions.length - 1);
    return declensions[index];
  }

  List<String> getUniqueDeclensions() {
    return N.shuffleList([
      this.dictionary,
      ...this.nominativ.forms,
      ...this.akuzativ.forms,
      ...this.instrumental.forms,
      ...this.lokativ.forms,
      ...this.dativ.forms,
      ...this.genitiv.forms,
      ...this.vokativ.forms,
    ].toSet().toList().where((element) => element.length > 0).toList());
  }

  longestForCase(CaseTypeEnum caseType) {
    int longestFound = 0;

    this.getDeclensions(caseType: caseType).forEach((d) {
      if (d.length > longestFound) {
        longestFound = d.length;
      }
    });

    return longestFound;
  }
}
