class CyrillicStateItem {
  final Function notifyListeners;
  final String latinString;
  final String cyrillicString;
  String userInput = '';

  CyrillicStateItem({
    required this.latinString,
    required this.cyrillicString,
    required this.notifyListeners,
  });

  void updateInput(String newVal) {
    this.userInput = newVal;
    this.notifyListeners();
  }
}
