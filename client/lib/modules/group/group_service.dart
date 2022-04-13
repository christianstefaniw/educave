import 'group_model.dart';
import 'group_repository_interface.dart';
import 'group_service_interface.dart';

class GroupService implements IGroupService {
  final IGroupRepository _repository;
  final GroupModel _model;

  GroupService(this._model, this._repository);

  @override
  Future<void> join() async {
    await _repository.join();
    _model.join();
  }

  @override
  String get groupPic => _model.groupPic;

  @override
  String get name => _model.name;

  @override
  String get summary => _model.summary;

  @override
  int get numMembers => _model.numMembers;

  @override
  int get numPosts => _model.numPosts;
}
