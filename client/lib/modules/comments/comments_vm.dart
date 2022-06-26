import '../../core/types/view_model.dart';
import '../../data/providers/api_provider.dart';
import '../comment/comment_repository.dart';
import 'account_data.dart';
import '../comment/comment_model.dart';
import 'comments_repository_interface.dart';

class CommentsViewModel with ViewModel {
  final ICommentsRepository _repository;
  final AccountCommentData _accountCommentData;
  List<CommentModel>? _comments;

  bool _newCommentValid = false;
  bool _mounted = true;

  CommentsViewModel(this._repository,
      {required AccountCommentData accountCommentData})
      : _accountCommentData = accountCommentData {
    _loadComments();
  }

  bool get commentBeingAddedIsValid => _newCommentValid;
  List<CommentModel>? get comments => _comments;
  bool get commentsLoaded => _comments != null;

  Future<void> _loadComments() async {
    _comments = await _repository.comments();

    if (_mounted) {
      notifyListeners();
    }
  }

  void validateComment(String content) {
    try {
      CommentModel.validate(content);
      _newCommentValid = true;
    } catch (e) {
      _newCommentValid = false;
    }

    notifyListeners();
  }

  void addComment(String content) {
    CommentModel newComment;

    try {
      newComment = CommentModel.create(
        CommentRepository(ApiProvider()),
        content,
        _accountCommentData.id,
        _accountCommentData.profilePic,
        _accountCommentData.name,
      );
    } catch (e) {
      return;
    }

    _comments!.add(newComment);
    _newCommentValid = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
