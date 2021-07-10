import 'package:flutter/foundation.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class CaseExercises with ChangeNotifier {
  Map<CaseTypeEnum, List<PANStateItem>> exerciseItems = {};

  CaseExercises() {
    exerciseItems[CaseTypeEnum.Nominativ] =
        List<PANStateItem>.empty(growable: true);

    exerciseItems[CaseTypeEnum.Akuzativ] =
        List<PANStateItem>.empty(growable: true);

    exerciseItems[CaseTypeEnum.Instrumental] =
        List<PANStateItem>.empty(growable: true);

    exerciseItems[CaseTypeEnum.Dativ] =
        List<PANStateItem>.empty(growable: true);

    exerciseItems[CaseTypeEnum.Lokativ] =
        List<PANStateItem>.empty(growable: true);

    exerciseItems[CaseTypeEnum.Genitiv] =
        List<PANStateItem>.empty(growable: true);

    exerciseItems[CaseTypeEnum.Vokativ] =
        List<PANStateItem>.empty(growable: true);
  }

  void add(CaseTypeEnum caseType, PANStateItem item) {
    exerciseItems[caseType]!.add(item);
    notifyListeners();
  }
}
