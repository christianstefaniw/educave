import '../group/group_model.dart';
import 'groups_repository_interface.dart';

class GroupsService {
  final IGroupsRepository _repository;
  List<GroupModel>? _groups;

  GroupsService(this._repository);

  Future<void> loadGroups() async {
    _groups = await _repository.groups();
  }

  List<GroupModel>? get groups => _groups;
}
