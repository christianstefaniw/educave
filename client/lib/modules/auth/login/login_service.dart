import '../../../core/helpers/errors_are_empty.dart';
import '../../../core/validators/validators.dart';
import '../../user/account_model.dart';
import 'login_repository_interface.dart';
import 'login_service_interface.dart';

class LoginService implements ILoginService {
  final ILoginRepository _repository;

  LoginService(this._repository);

  Map<String, String?> _validationErrors = <String, String?>{};

  @override
  Map<String, String?> get validationErrors => _validationErrors;

  @override
  bool validate(String email, String password) {
    Map<String, String?> errors = {};

    errors['email'] = validateEmail(email);
    errors['password'] = validatePassword(password);

    if (!errorsAreEmpty(errors)) {
      _validationErrors = errors;
      return false;
    }

    return true;
  }

  @override
  Future<AccountModel?> login(String email, String password) async {
    AccountModel account = await _repository.login(email, password);

    return account;
  }
}
