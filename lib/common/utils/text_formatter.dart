class TextFormatter {
  static String capitalizeFirstChar({required String word}) {
    return word.substring(0, 1).toUpperCase() + word.substring(1, word.length);
  }
}
