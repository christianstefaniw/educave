import '../../../core/types/controller.dart';
import '../../user/account_model.dart';
import 'login_service_interface.dart';

class LoginController with Controller {
  final ILoginService _service;

  LoginController(this._service);

  Map<String, String?> get validationErrors => _service.validationErrors;

  Future<AccountModel?> login(String email, String password) async {
    if (!_service.validate(email, password)) {
      notifyListeners();
      return null;
    }

    AccountModel? account = await _service.login(email, password);
    return account;
  }
}
