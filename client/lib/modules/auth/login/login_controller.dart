import '../../../core/helpers/errors_are_empty.dart';
import '../../../core/types/controller.dart';
import '../../../core/validators/validators.dart';
import '../../../data/providers/api_provider.dart';
import '../../user/account_model.dart';
import 'login_repository.dart';
import 'login_repository_interface.dart';

class LoginController with Controller {
  final ILoginRepository _loginRepository =
      LoginRepository(client: ApiProvider());

  Map<String, String?> _validationErrors = <String, String?>{};

  Map<String, String?> get validationErrors => _validationErrors;

  bool validate(String email, String password) {
    Map<String, String?> errors = {};

    errors['email'] = validateEmail(email);
    errors['password'] = validatePassword(password);

    if (!errorsAreEmpty(errors)) {
      _validationErrors = errors;
      notifyListeners();
      return false;
    }

    return true;
  }

  Future<AccountModel?> login(String email, String password) async {
    if (!validate(email, password)) {
      return null;
    }

    AccountModel account = await _loginRepository.login(email, password);

    return account;
  }
}
