import '../../../core/value_objects/value_objects.dart';
import '../../../data/providers/api_provider_interface.dart';
import '../../account/account_model.dart';
import 'login_dto.dart';
import 'login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final IApiProvider _client;

  LoginRepository(this._client);

  @override
  Future<AccountModel> login(LoginDto loginDto) async {
    return AccountModel(
        id: 'id',
        email: EmailAddress('test@gmail.com'),
        profilePic: 'profilePic',
        firstName: 'firstName',
        lastName: 'lastName');
  }
}
