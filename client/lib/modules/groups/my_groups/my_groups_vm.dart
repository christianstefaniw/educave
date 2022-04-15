import '../groups_service_interface.dart';
import '../abstract_groups_vm.dart';
import '../strategies/my_groups.dart';

class MyGroupsViewModel extends GroupsViewModel {
  MyGroupsViewModel(IGroupsService groupsService) : super(groupsService) {
    this.groupsService.setFetchGroupsStrategy(MyGroups());
  }
}
