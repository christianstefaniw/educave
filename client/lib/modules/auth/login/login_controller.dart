import 'package:client/core/helpers/errors_are_empty.dart';
import 'package:client/data/provider/api_provider.dart';
import 'package:client/modules/account/account_model.dart';
import 'package:client/modules/auth/login/login_repository.dart';
import 'package:flutter/material.dart';

import '../../../core/validators/validators.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository loginRepository =
      LoginRepository(client: ApiProvider());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Map<String, String?> validationErrors = <String, String?>{};

  bool validate() {
    Map<String, String?> errors = {};

    errors['email'] = validateEmail(emailController.text);
    errors['password'] = validatePassword(passwordController.text);

    if (!errorsAreEmpty(errors)) {
      validationErrors = errors;
      notifyListeners();
      return false;
    }

    return true;
  }

  void login() async {
    if (!validate()) {
      return;
    }

    AccountModel account = await loginRepository.login(
        emailController.text, passwordController.text);
  }
}
