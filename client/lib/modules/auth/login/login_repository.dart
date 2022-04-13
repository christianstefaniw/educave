import '../../../data/providers/api_provider_interface.dart';
import '../../user/account_model.dart';
import 'login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final IApiProvider _client;

  LoginRepository(this._client);

  @override
  Future<AccountModel> login(String email, String password) async {
    AccountModel account = AccountModel(email: "email", profilePic: 'test');
    await _client.get('');
    // AccountModel account = await client.post(ApiAuthRoutes.login, data: null);
    return account;
  }
}
