import 'package:flutter/material.dart';

import '../../../core/helpers/errors_are_empty.dart';
import '../../../core/types/controller.dart';
import '../../../core/validators/validators.dart';
import '../../../data/providers/api_provider.dart';
import '../../account/account_model.dart';
import 'login_repository.dart';

class LoginController extends Controller {
  final LoginRepository _loginRepository =
      LoginRepository(client: ApiProvider());

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Map<String, String?> _validationErrors = <String, String?>{};

  Map<String, String?> get validationErrors => _validationErrors;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  bool validate() {
    Map<String, String?> errors = {};

    errors['email'] = validateEmail(_emailController.text);
    errors['password'] = validatePassword(_passwordController.text);

    if (!errorsAreEmpty(errors)) {
      _validationErrors = errors;
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

    AccountModel account = await _loginRepository.login(
        _emailController.text, _passwordController.text);

    return account;
  }
}
