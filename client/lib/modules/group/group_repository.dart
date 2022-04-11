import '../../data/providers/api_provider_interface.dart';
import 'group_repository_interface.dart';

class GroupRepository implements IGroupRepository {
  final String _groupId;
  final IApiProvider _client;

  GroupRepository(this._client, {required String groupId}) : _groupId = groupId;

  @override
  Future<void> join() async {
    // await _client.get('');
  }
}
