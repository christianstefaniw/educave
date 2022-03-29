class PasswordValidator {
  static String? run(String? password) {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

    if (password == null || password.isEmpty) {
      return 'Enter a password';
    }

    if (!passwordRegExp.hasMatch(password)) {
      return 'Invalid password';
    }

    return null;
  }
}
