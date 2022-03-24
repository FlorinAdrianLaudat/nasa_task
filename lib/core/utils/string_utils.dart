class StringUtils {
  static bool isNotNullOrEmpty(String? input) {
    if (input != null && input.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
