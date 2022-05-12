import '../../core/types/view_model.dart';
import 'comment_service_interface.dart';

class CommentViewModel with ViewModel {
  final ICommentService _service;

  CommentViewModel(this._service);

  String get name => _service.name;
  String get profilePic => _service.profilePic;
  String get content => _service.content;

  void like() {
    _service.like();
    notifyListeners();
  }
}
