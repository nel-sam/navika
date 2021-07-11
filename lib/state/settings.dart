import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/models.dart';

class Settings with ChangeNotifier {
  SettingsSet settings = SettingsSet();

  void setSettings({
    EntryTypes? entryType,
    bool? possessivePronounsIncluded,
    bool? personalPronounsIncluded,
    bool? adjectivesIncluded,
    bool? nounsIncluded,
  }) {
    var newSettings = SettingsSet(
      entryType: entryType != null ? entryType : settings.entryType,
      possessivePronounsIncluded: possessivePronounsIncluded != null
          ? possessivePronounsIncluded
          : settings.possessivePronounsIncluded,
      personalPronounsIncluded: personalPronounsIncluded != null
          ? personalPronounsIncluded
          : settings.personalPronounsIncluded,
      adjectivesIncluded: adjectivesIncluded != null
          ? adjectivesIncluded
          : settings.adjectivesIncluded,
      nounsIncluded:
          nounsIncluded != null ? nounsIncluded : settings.nounsIncluded,
    );

    this.settings = newSettings;
  }
}
