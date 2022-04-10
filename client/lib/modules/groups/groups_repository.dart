import '../../data/providers/api_provider_interface.dart';
import '../group/group_model.dart';
import 'groups_repository_interface.dart';
import 'strategies/fetch_groups_strategy.dart';

class GroupsRepository implements IGroupsRepository {
  final IApiProvider _client;
  final FetchGroupsStrategy _fetchStrategy;

  GroupsRepository(this._client, {required FetchGroupsStrategy fetchStrategy})
      : _fetchStrategy = fetchStrategy;

  @override
  Future<List<GroupModel>> groups() async {
    return _fetchStrategy.execute(_client);
  }
}
