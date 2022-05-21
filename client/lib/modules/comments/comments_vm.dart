import '../../core/types/view_model.dart';
import '../comment/comment_model.dart';
import 'comments_service_interface.dart';

class CommentsViewModel with ViewModel {
  final ICommentsService _service;
  bool _mounted = true;
  bool _commentBeingAddedIsValid = false;

  CommentsViewModel(this._service);

  List<CommentModel>? get comments => _service.comments;
  bool get commentBeingAddedIsValid => _commentBeingAddedIsValid;
  bool get commentsLoaded => comments != null;

  Future<void> loadComments() async {
    await _service.loadComments();

    if (_mounted) {
      notifyListeners();
    }
  }

  void validateCommentDynamically(String content) {
    _commentBeingAddedIsValid = _service.validateComment(content);
    notifyListeners();
  }

  void addComment({required String content, required String userId}) {
    if (!_commentBeingAddedIsValid) {
      return;
    }
    _service.addComment(content, userId);
    _commentBeingAddedIsValid = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
