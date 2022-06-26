import '../../account/account_model.dart';
import 'login_dto.dart';
import 'login_repository_interface.dart';

class LoginModel {
  final ILoginRepository _repository;

  LoginModel(this._repository);

  Future<AccountModel> login(LoginDto loginDto) async {
    return await _repository.login(loginDto);
  }
}
