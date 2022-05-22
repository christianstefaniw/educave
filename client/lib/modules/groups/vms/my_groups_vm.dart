import '../groups_repository_interface.dart';
import '../abstract_groups_vm.dart';
import '../strategies/my_groups.dart';

class MyGroupsViewModel extends GroupsViewModel {
  MyGroupsViewModel(IGroupsRepository repository) : super(repository) {
    repository.setFetchGroupsStrategy(MyGroups());
  }
}
