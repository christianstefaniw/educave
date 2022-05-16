import '../../data/providers/api_provider_interface.dart';
import 'group_repository_interface.dart';

class GroupRepository implements IGroupRepository {
  final IApiProvider _client;

  GroupRepository(this._client);

  @override
  Future<void> delete() async {}

  @override
  Future<void> join() async {
    // await _client.get('');
  }

  @override
  Future<void> unjoin() async {
    // await _client.get('');
  }
}
