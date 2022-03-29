import '../../../data/provider/api_provider_interface.dart';
import '../../account/account_model.dart';
import 'login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final IApiProvider client;

  LoginRepository({required this.client});

  @override
  Future<AccountModel> login(String email, String password) {
    throw UnimplementedError();
  }
}
