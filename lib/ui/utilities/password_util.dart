class PasswordUtil {
  static bool hasUpperCase(String password) {
    return RegExp('(?:[A-Z])').hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp('(?:[a-z])').hasMatch(password);
  }

  static bool hasSymbol(String password) {
    return RegExp(r"[!@#$%^&*(),\|+=;.?':{}|<>]").hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp('(?=.*?[0-9])').hasMatch(password);
  }
}
