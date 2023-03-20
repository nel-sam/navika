import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';
import 'package:nrs_flutter_lib/extensions.dart';

class Noun {
  final List<Tags> tags;
  final Genders gender;
  final String dictionary;
  final bool isAnimate;

  final DeclensionByCount nominativ;
  final DeclensionByCount akuzativ;
  final DeclensionByCount instrumental;
  final DeclensionByCount lokativ;
  late DeclensionByCount? dativ;
  final DeclensionByCount genitiv;
  final DeclensionByCount vokativ;

  String? extraInfo;

  Noun({
    required this.tags,
    required this.dictionary,
    required this.gender,
    required this.isAnimate,
    required this.nominativ,
    required this.akuzativ,
    required this.instrumental,
    required this.lokativ,
    required this.genitiv,
    required this.vokativ,
    this.dativ,
    this.extraInfo = "",
  }) {
    if (this.dativ == null) {
      this.dativ = this.lokativ;
    }
  }

  DeclensionByCount getDeclensionObject(Cases caseType) {
    switch (caseType) {
      case Cases.Aku:
        return this.akuzativ;
      case Cases.Dat:
        return this.dativ!;
      case Cases.Gen:
        return this.genitiv;
      case Cases.Ins:
        return this.instrumental;
      case Cases.Lok:
        return this.lokativ;
      case Cases.Nom:
      case Cases.All:
      case Cases.Unspecified:
        return this.nominativ;
      case Cases.Vok:
        return this.vokativ;
    }
  }

  List<String> getDeclensionsForCaseType(Cases caseType) {
    switch (caseType) {
      case Cases.Ins:
        return this.instrumental.getAll();
      case Cases.Nom:
      case Cases.All:
      case Cases.Unspecified:
        return this.nominativ.getAll();
      case Cases.Aku:
        return this.akuzativ.getAll();
      case Cases.Vok:
        return this.vokativ.getAll();
      case Cases.Lok:
        return this.lokativ.getAll();
      case Cases.Gen:
        return this.genitiv.getAll();
      case Cases.Dat:
        return this.dativ!.getAll();
    }
  }

  getDropDownInitial(Cases caseType) {
    final toAvoid = getDeclensionsForCaseType(caseType);
    final filtered = getUniqueDeclensions(shuffle: true);
    filtered.removeWhere((element) => toAvoid.contains(element));
    return filtered.last;
  }

  List<String> getUniqueDeclensions({bool shuffle = false}) {
    var result = [
      this.dictionary,
      ...this.nominativ.singular,
      ...this.akuzativ.singular,
      ...this.instrumental.singular,
      ...this.lokativ.singular,
      ...this.dativ!.singular,
      ...this.genitiv.singular,
      ...this.vokativ.singular,
      ...this.nominativ.plural,
      ...this.akuzativ.plural,
      ...this.instrumental.plural,
      ...this.lokativ.plural,
      ...this.dativ!.plural,
      ...this.genitiv.plural,
      ...this.vokativ.plural,
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
}
