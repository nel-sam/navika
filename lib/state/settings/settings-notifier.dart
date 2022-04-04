import 'package:flutter/material.dart';
import 'package:navika/models/settings.dart';

class SettingsNotifier with ChangeNotifier {
  late Settings settings;

  SettingsNotifier() {
    // TODO: Load settings from disk
    settings = Settings();
  }

  setAutoNextQuestion(bool newVal) {
    this.settings.autoNextQuestion = newVal;
    notifyListeners();
  }
}
