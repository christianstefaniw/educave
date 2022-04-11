import '../../data/providers/api_provider_interface.dart';
import 'user_repository_interface.dart';

class UserRepository implements IUserRepository {
  final IApiProvider _client;

  UserRepository(this._client);
}
