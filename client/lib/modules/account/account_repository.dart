import '../../data/providers/api_provider_interface.dart';
import 'account_repository_interface.dart';

class AccountRepository implements IAccountRepository {
  final IApiProvider _client;

  AccountRepository(this._client);
}
