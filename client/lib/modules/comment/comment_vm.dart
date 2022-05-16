import '../../core/types/view_model.dart';
import 'comment_service_interface.dart';

class CommentViewModel with ViewModel {
  final ICommentService _service;

  CommentViewModel(this._service);

  String get username => _service.username;
  String get profilePic => _service.profilePic;
  String get content => _service.content;
  bool get liked => _service.liked;
  int get likeCount => _service.likeCount;
  String get timeSincePost => _service.timeSincePost;

  void like() {
    _service.like();
    notifyListeners();
  }

  void unlike() {
    _service.unlike();
    notifyListeners();
  }

  void delete() {
    _service.delete();
    notifyListeners();
  }
}
