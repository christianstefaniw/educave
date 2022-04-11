import 'group_model.dart';
import 'group_repository_interface.dart';
import 'group_service_interface.dart';

class GroupService implements IGroupService {
  final IGroupRepository _repository;
  final GroupModel _model;
  final String _userId;

  GroupService(this._model, this._repository, {required String userId})
      : _userId = userId;

  @override
  Future<void> join() async {
    await _repository.join(_userId);
    _model.join();
  }
}
