import '../../core/types/view_model.dart';
import 'group_model.dart';
import 'group_repository_interface.dart';

class GroupViewModel with ViewModel {
  final IGroupRepository _repository;
  final GroupModel _model;

  GroupViewModel(this._repository, this._model);

  String get id => _model.id;
  String get groupPic => _model.groupPic;
  String get backgroundPic => _model.backgroundPic;
  String get name => _model.name;
  String get summary => _model.summary;
  int get numMembers => _model.numMembers;
  int get numPosts => _model.numPosts;
  bool get joined => _model.joined;

  void join() async {
    _repository.join();
    _model.join();
    notifyListeners();
  }

  void unjoin() {
    _repository.unjoin();
    _model.unjoin();
    notifyListeners();
  }
}
