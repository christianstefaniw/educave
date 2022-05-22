import '../groups_repository_interface.dart';
import '../abstract_groups_vm.dart';
import '../strategies/top_groups.dart';

class TopGroupsViewModel extends GroupsViewModel {
  TopGroupsViewModel(IGroupsRepository repository) : super(repository) {
    repository.setFetchGroupsStrategy(TopGroups());
  }
}
