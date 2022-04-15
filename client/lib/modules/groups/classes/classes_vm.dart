import '../abstract_groups_vm.dart';
import '../groups_service_interface.dart';
import '../strategies/classes.dart';

class ClassesViewModel extends GroupsViewModel {
  ClassesViewModel(IGroupsService service) : super(service) {
    groupsService.setFetchGroupsStrategy(Classes());
  }
}
