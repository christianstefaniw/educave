import '../../core/types/view_model.dart';
import '../comment/comment_model.dart';
import 'comments_repository_interface.dart';

class CommentsViewModel with ViewModel {
  final ICommentsRepository _repository;

  bool _mounted = true;
  Map<String, String> addCommentValidationErrors = {};

  List<CommentModel>? _comments;

  CommentsViewModel(this._repository);

  List<CommentModel>? get comments => _comments;

  void addComment(
      String content, String userId, String profilePic, String username) {
    if (_comments == null) return;
    try {
      final newComment =
          CommentModel.create(content, userId, profilePic, username);
      _repository.addComment(newComment);
      _comments = [..._comments!, newComment];
    } catch (e) {
      addCommentValidationErrors = e as Map<String, String>;
    }

    notifyListeners();
  }

  Future<void> loadComments() async {
    _comments = await _repository.comments();

    if (_mounted) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
