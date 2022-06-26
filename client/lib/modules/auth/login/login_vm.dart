import '../../../core/types/view_model.dart';
import '../../account/account_model.dart';
import 'login_model.dart';

class LoginViewModel with ViewModel {
  final LoginModel _model;
  Map<String, String> _validationErrors = {};

  LoginViewModel(this._model);

  Map<String, String> get validationErrors => _validationErrors;

  Future<AccountModel?> login(String email, String password) async {
    AccountModel account;

    try {
      account = AccountModel.create(email, password);
    } catch (e) {
      _validationErrors = e as Map<String, String>;
      notifyListeners();
      return null;
    }

    return await _model.login(account);
  }
}
