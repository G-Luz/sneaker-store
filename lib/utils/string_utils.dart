extension StringUtils on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(trim());
  }

  bool isValidPassword() {
    return length > 4;
  }

  bool isValidFieldLength({required int length}) {
    final unmaskedText = replaceAll('.', '')
        .replaceAll('-', '')
        .replaceAll('/', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .trim();
    return unmaskedText.length >= length;
  }
}
