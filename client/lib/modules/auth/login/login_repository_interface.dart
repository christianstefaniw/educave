import '../../user/account_model.dart';

abstract class ILoginRepository {
  Future<AccountModel> login(String email, String password);
}
