import '../../data/providers/api_provider.dart';
import '../group/group_model.dart';
import 'groups_repository.dart';
import 'groups_repository_interface.dart';
import 'groups_service_interface.dart';
import 'strategies/fetch_groups_strategy.dart';

class GroupsService implements IGroupsService {
  final IGroupsRepository _repository = GroupsRepository(ApiProvider());
  List<GroupModel>? _groups;

  @override
  Future<void> loadGroups() async {
    _groups = await _repository.groups();
  }

  @override
  List<GroupModel>? get groups => _groups;

  @override
  void setFetchGroupsStrategy(FetchGroupsStrategy strategy) {
    _repository.setFetchGroupsStrategy(strategy);
  }
}
