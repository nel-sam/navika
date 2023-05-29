import 'package:navika/models/enums.dart';

class Settings {
  bool isFirstTime;
  bool autoNextQuestion;
  bool isPremium;
  DialectType dialectType;

  Settings(
      {this.isFirstTime = true,
      this.autoNextQuestion = true,
      this.isPremium = true,
      this.dialectType = DialectType.Bosnia});
}
