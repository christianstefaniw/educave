import '../../../data/providers/api_provider_interface.dart';
import '../../account/account_model.dart';
import 'login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final IApiProvider _client;

  LoginRepository(this._client);

  @override
  Future<AccountModel> login(AccountModel account) async {
    return account;
  }
}
