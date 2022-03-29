import 'package:client/core/validators/email.dart';
import 'package:client/core/validators/password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final validationErrors = <String, String?>{}.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool validate() {
    Map<String, String?> errors = {};

    errors['email'] = EmailValidator.run(emailController.value.text);
    errors['password'] = PasswordValidator.run(passwordController.value.text);

    if (errors.isNotEmpty) {
      validationErrors.value = errors;
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
