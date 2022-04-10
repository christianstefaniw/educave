import '../../data/providers/api_provider_interface.dart';
import 'group_repository_interface.dart';

class GroupRepository implements IGroupRepository {
  final String _id;
  final IApiProvider _client;

  GroupRepository({required String id, required IApiProvider client})
      : _id = id,
        _client = client;

  @override
  Future<void> joinGroup() async {
    // await _client.get('');
  }
}
