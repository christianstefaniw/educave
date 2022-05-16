import '../../core/types/view_model.dart';
import '../comment/comment_model.dart';
import 'comments_service_interface.dart';

class CommentsViewModel with ViewModel {
  final ICommentsService _service;
  bool _mounted = true;

  CommentsViewModel(this._service);

  List<CommentModel>? get comments => _service.comments;

  Future<void> loadComments() async {
    await _service.loadComments();

    if (_mounted) {
      notifyListeners();
    }
  }

  void addComment(CommentModel comment) {
    _service.addComment(comment);
    notifyListeners();
  }

  bool get commentsLoaded => comments != null;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
