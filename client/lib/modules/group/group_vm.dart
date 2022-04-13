import '../../core/types/view_model.dart';
import 'group_service_interface.dart';

class GroupViewModel with ViewModel {
  final IGroupService _service;

  GroupViewModel(this._service);

  String get groupPic => _service.groupPic;
  String get name => _service.name;
  String get summary => _service.summary;
  int get numMembers => _service.numMembers;
  int get numPosts => _service.numPosts;
  bool get joined => _service.joined;

  Future<void> join() async {
    await _service.join();
    notifyListeners();
  }

  Future<void> unjoin() async {
    await _service.unjoin();
    notifyListeners();
  }
}
