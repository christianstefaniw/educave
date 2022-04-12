import '../../core/types/view_model.dart';
import 'group_service_interface.dart';

class GroupViewModel with ViewModel {
  final IGroupService _service;

  GroupViewModel(this._service);

  Future<void> join() async {
    await _service.join();
    notifyListeners();
  }
}
