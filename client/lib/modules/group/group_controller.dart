import '../../core/types/controller.dart';
import 'group_service_interface.dart';

class GroupController with Controller {
  final IGroupService _service;

  GroupController(this._service);

  Future<void> join() async {
    await _service.join();
    notifyListeners();
  }
}
