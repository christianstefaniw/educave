import '../strategies/all.dart';
import '../users_service_interface.dart';
import '../abstract_users_vm.dart';

class AllUsersViewModel extends UsersViewModel {
  AllUsersViewModel(IUsersService usersService) : super(usersService) {
    this.usersService.setFetchUsersStrategy(AllUsers());
  }
}
