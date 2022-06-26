import '../../account/account_model.dart';
import 'login_repository_interface.dart';

class LoginModel {
  final ILoginRepository _repository;

  LoginModel(this._repository);

  Future<AccountModel> login(AccountModel account) async {
    return await _repository.login(account);
  }
}
