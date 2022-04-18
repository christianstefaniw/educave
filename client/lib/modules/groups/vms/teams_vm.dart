import '../abstract_groups_vm.dart';
import '../groups_service_interface.dart';
import '../strategies/teams.dart';

class TeamsViewModel extends GroupsViewModel {
  TeamsViewModel(IGroupsService service) : super(service) {
    groupsService.setFetchGroupsStrategy(Teams());
  }
}
