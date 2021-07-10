import 'package:flutter/material.dart';
import 'package:navika/models/models.dart';

class Settings with ChangeNotifier {
  SettingsSet settings = SettingsSet();

  void setSettings(SettingsSet settings) {
    this.settings = settings;
  }
}
