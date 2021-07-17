import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class Settings with ChangeNotifier {
  final SettingsSet settings = SettingsSet(
    entryType: EntryTypes.FreeForm,
    possessivePronounsIncluded: true,
    adjectivesIncluded: true,
    nounsIncluded: true,
    personalPronounsIncluded: true,
  );

  void setSettings({
    EntryTypes? entryType,
    bool? possessivePronounsIncluded,
    bool? personalPronounsIncluded,
    bool? adjectivesIncluded,
    bool? nounsIncluded,
  }) {
    settings.entryType = entryType != null ? entryType : settings.entryType;
    settings.possessivePronounsIncluded = possessivePronounsIncluded != null
        ? possessivePronounsIncluded
        : settings.possessivePronounsIncluded;
    settings.personalPronounsIncluded = personalPronounsIncluded != null
        ? personalPronounsIncluded
        : settings.personalPronounsIncluded;
    settings.adjectivesIncluded = adjectivesIncluded != null
        ? adjectivesIncluded
        : settings.adjectivesIncluded;
    settings.nounsIncluded =
        nounsIncluded != null ? nounsIncluded : settings.nounsIncluded;

    // TODO: Rebuild exercise widget so user can
    // start over
    notifyListeners();
  }
}
