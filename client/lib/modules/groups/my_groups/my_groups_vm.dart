import '../../../core/types/view_model.dart';
import '../../group/group_model.dart';
import '../groups_service_interface.dart';
import '../strategies/my_groups.dart';

class MyGroupsViewModel with ViewModel {
  final IGroupsService _groupsService;

  MyGroupsViewModel(this._groupsService) {
    _groupsService.setFetchGroupsStrategy(MyGroups());
  }

  List<GroupModel>? get groups => _groupsService.groups;

  Future<void> loadGroups() async {
    await _groupsService.loadGroups();
    notifyListeners();
  }

  bool get groupsLoaded => groups != null;
}
