import '../abstract_groups_vm.dart';
import '../groups_service_interface.dart';
import '../strategies/clubs.dart';

class ClubsViewModel extends GroupsViewModel {
  ClubsViewModel(IGroupsService service) : super(service) {
    groupsService.setFetchGroupsStrategy(Clubs());
  }
}
