import '../../../core/types/view_model.dart';
import '../../account/account_model.dart';
import 'login_dto.dart';
import 'login_model.dart';

class LoginViewModel with ViewModel {
  final LoginModel _model;
  String? _validationError;

  LoginViewModel(this._model);

  String? get validationError => _validationError;

  Future<AccountModel?> login(String email, String password) async {
    LoginDto loginDto;

    try {
      loginDto = LoginDto(email, password);
    } catch (e) {
      _validationError = e as String;
      notifyListeners();
      return null;
    }

    return await _model.login(loginDto);
  }
}
