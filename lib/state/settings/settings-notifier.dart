import 'package:flutter/material.dart';
import 'package:navika/models/enums.dart';
import 'package:navika/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier with ChangeNotifier {
  Future<Settings> getAllSettings() async {
    Settings settings = Settings();
    final preferences = await getPreferencesInstance();

    settings.isFirstTime =
        (preferences.getBool(SettingsKeys.isFirstTime.toString()) ??
            settings.isFirstTime);

    settings.autoNextQuestion =
        (preferences.getBool(SettingsKeys.autoNextQuestion.toString()) ??
            settings.autoNextQuestion);

    settings.isPremium =
        (preferences.getBool(SettingsKeys.isPremium.toString()) ??
            settings.isPremium);

    settings.dialectType = dialectTypeStrToEnum(preferences, settings);

    return settings;
  }

  Future<SharedPreferences> getPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future resetSettings() async {
    final defaultSettings = Settings();
    final pref = (await getPreferencesInstance());
    pref.setBool(SettingsKeys.autoNextQuestion.toString(),
        defaultSettings.autoNextQuestion);
    pref.setBool(
        SettingsKeys.isFirstTime.toString(), defaultSettings.isFirstTime);
    pref.setBool(SettingsKeys.isPremium.toString(), defaultSettings.isPremium);
    pref.setString(
        SettingsKeys.dialectType.toString(), defaultSettings.dialectType.name);

    notifyListeners();
  }

  Future setBoolSetting(SettingsKeys key, bool newVal) async {
    final pref = (await getPreferencesInstance());
    pref.setBool(key.toString(), newVal);
    notifyListeners();
  }

  Future setDialectType(DialectType newVal) async {
    final pref = (await getPreferencesInstance());
    final strVal = newVal.name;
    pref.setString(SettingsKeys.dialectType.toString(), strVal);
    notifyListeners();
  }

  static DialectType dialectTypeStrToEnum(
      SharedPreferences preferences, Settings settings) {
    final key = SettingsKeys.dialectType.toString();
    final fromDisk = preferences.getString(key);

    final matching = DialectType.values
        .firstWhere((DialectType e) => e.name.toString() == fromDisk);

    return matching;
  }
}
