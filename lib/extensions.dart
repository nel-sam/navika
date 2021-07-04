extension ExtendedText on List<String> {
  List<String> removeList(List<String> toRemove) {
    List<String> result = [...this];

    for (int i = 0; i < result.length; i++) {
      if (toRemove.contains(result[i])) {
        result.removeAt(i);
      }
    }

    print('${result} <> ${toRemove}');
    return result;
  }
}
