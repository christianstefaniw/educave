import '../abstract_groups_vm.dart';
import '../groups_repository_interface.dart';
import '../strategies/clubs.dart';

class ClubsViewModel extends GroupsViewModel {
  ClubsViewModel(IGroupsRepository repository) : super(repository) {
    repository.setFetchGroupsStrategy(Clubs());
  }
}
