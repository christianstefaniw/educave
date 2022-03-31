import 'package:flutter/material.dart';

import '../../../core/helpers/errors_are_empty.dart';
import '../../../core/validators/validators.dart';
import '../../../data/providers/api_provider.dart';
import '../../account/account_model.dart';
import 'login_repository.dart';

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

  /// Return true if logged in, false if not
  Future<AccountModel?> login() async {
    if (!validate()) {
      return null;
    }

    AccountModel account = await loginRepository.login(
        emailController.text, passwordController.text);

    return account;
  }
}
