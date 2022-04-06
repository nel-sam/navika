import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier with ChangeNotifier {
  Future<Settings> getAllSettings() async {
    Settings settings = Settings();
    final preferences = await getPreferencesInstance();

    settings.autoNextQuestion =
        (preferences.getBool(SettingsKeys.autoNextQuestion.toString()) ??
            getDefaultValue(SettingsKeys.autoNextQuestion));

    return settings;
  }

  Future<bool> getBoolSetting(SettingsKeys key) async {
    final preferences = await getPreferencesInstance();
    return (preferences.getBool(key.toString()) ?? getDefaultValue(key));
  }

  getDefaultValue(SettingsKeys key) {
    switch (key) {
      case SettingsKeys.autoNextQuestion:
        return true;
    }
  }

  Future<SharedPreferences> getPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future setBoolSetting(SettingsKeys key, bool newVal) async {
    final pref = (await getPreferencesInstance());
    pref.setBool(key.toString(), newVal);
    notifyListeners();
  }
}
