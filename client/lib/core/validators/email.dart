String? validateEmail(String? email) {
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  if (email == null || email.isEmpty) {
    return 'Enter an email';
  }

  if (!emailRegExp.hasMatch(email)) {
    return 'Invalid email';
  }

  return null;
}
