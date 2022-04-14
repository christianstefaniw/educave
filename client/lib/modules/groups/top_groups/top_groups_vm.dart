import '../groups_service_interface.dart';
import '../groups_vm.dart';
import '../strategies/top_groups.dart';

class TopGroupsViewModel extends GroupsViewModel {
  TopGroupsViewModel(IGroupsService groupsService) : super(groupsService) {
    this.groupsService.setFetchGroupsStrategy(TopGroups());
  }
}
