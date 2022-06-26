import '../../account/account_model.dart';
import 'login_dto.dart';

abstract class ILoginRepository {
  Future<AccountModel> login(LoginDto loginDto);
}
