import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:navika/extensions.dart';

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

  List<String> getDeclensionsForCaseType(Cases caseType) {
    switch (caseType) {
      case Cases.Aku:
        return this.akuzativ.forms;
      case Cases.Dat:
        return this.dativ.forms;
      case Cases.Gen:
        return this.genitiv.forms;
      case Cases.Ins:
        return this.instrumental.forms;
      case Cases.Lok:
        return this.lokativ.forms;
      case Cases.Nom:
        return this.nominativ.forms;
      case Cases.Vok:
        return this.vokativ.forms;
    }
  }

  List<String> getUniqueDeclensions({bool shuffle = false}) {
    var result = [
      this.dictionary,
      ...this.nominativ.forms,
      ...this.akuzativ.forms,
      ...this.instrumental.forms,
      ...this.lokativ.forms,
      ...this.dativ.forms,
      ...this.genitiv.forms,
      ...this.vokativ.forms,
    ].toSet().toList().where((element) => element.length > 0).toList();

    return shuffle ? result.shuffleStrings() : result;
  }

  longestForCase(Cases caseType) {
    int longestFound = 0;

    this.getDeclensionsForCaseType(caseType).forEach((d) {
      if (d.length > longestFound) {
        longestFound = d.length;
      }
    });

    return longestFound;
  }

  getDropDownInitial(Cases caseType) {
    final toAvoid = getDeclensionsForCaseType(caseType);
    final filtered = getUniqueDeclensions(shuffle: true);
    filtered.removeWhere((element) => toAvoid.contains(element));
    return filtered.last;
  }
}
