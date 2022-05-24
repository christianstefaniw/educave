import '../../core/types/view_model.dart';
import '../group/group_model.dart';
import 'groups_repository_interface.dart';

abstract class GroupsViewModel with ViewModel {
  final IGroupsRepository repository;

  bool _mounted = true;
  List<GroupModel>? _groups;

  GroupsViewModel(this.repository);

  List<GroupModel>? get groups => _groups;

  Future<void> loadGroups() async {
    _groups = await repository.groups();

    if (_mounted) {
      notifyListeners();
    }
  }

  bool get groupsLoaded => _groups != null;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
