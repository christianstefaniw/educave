import 'package:flutter/material.dart';

import '../../../core/validators/validators.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Map<String, String?> validationErrors = <String, String?>{};

  bool validate() {
    Map<String, String?> errors = {};

    errors['email'] = validateEmail(emailController.value.text);
    errors['password'] = validatePassword(passwordController.value.text);

    if (errors.isNotEmpty) {
      validationErrors = errors;
      notifyListeners();
      return false;
    }

    return true;
  }

  void login() {
    if (!validate()) {
      return;
    }
  }
}
