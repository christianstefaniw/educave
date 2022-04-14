import '../../../core/types/view_model.dart';
import '../../account/account_model.dart';
import 'login_service_interface.dart';

class LoginViewModel with ViewModel {
  final ILoginService _service;

  LoginViewModel(this._service);

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
