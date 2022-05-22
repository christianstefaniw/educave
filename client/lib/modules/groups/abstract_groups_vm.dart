import '../../core/types/view_model.dart';
import '../group/group_model.dart';
import 'groups_repository_interface.dart';

abstract class GroupsViewModel with ViewModel {
  final IGroupsRepository repository;

  List<GroupModel>? _groups;

  GroupsViewModel(this.repository);

  List<GroupModel>? get groups => _groups;

  Future<void> loadGroups() async {
    _groups = await repository.groups();
    notifyListeners();
  }

  bool get groupsLoaded => _groups != null;
}
