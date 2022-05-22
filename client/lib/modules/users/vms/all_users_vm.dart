import '../strategies/all.dart';
import '../users_repository_interface.dart';
import '../abstract_users_vm.dart';

class AllUsersViewModel extends UsersViewModel {
  AllUsersViewModel(IUsersRepository repository) : super(repository) {
    repository.setFetchUsersStrategy(AllUsers());
  }
}
