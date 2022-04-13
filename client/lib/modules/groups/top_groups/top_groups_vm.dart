import '../../../core/types/view_model.dart';
import '../../group/group_model.dart';
import '../groups_service_interface.dart';
import '../strategies/top_groups.dart';

class TopGroupsViewModel with ViewModel {
  final IGroupsService _groupsService;

  TopGroupsViewModel(this._groupsService) {
    _groupsService.setFetchGroupsStrategy(TopGroups());
  }

  List<GroupModel>? get groups => _groupsService.groups;

  Future<void> loadGroups() async {
    await _groupsService.loadGroups();
    notifyListeners();
  }

  bool get groupsLoaded => groups != null;
}
