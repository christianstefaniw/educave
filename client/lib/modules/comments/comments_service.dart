import '../../core/helpers/errors_are_empty.dart';
import '../../core/validators/validators.dart';
import '../comment/comment_model.dart';
import 'comments_repository_interface.dart';
import 'comments_service_interface.dart';

class CommentsService implements ICommentsService {
  final ICommentsRepository _repository;
  List<CommentModel>? _comments;

  CommentsService(this._repository);

  @override
  List<CommentModel>? get comments => _comments;

  @override
  Future<void> loadComments() async {
    _comments = await _repository.comments();
  }

  @override
  bool validateComment(String content) {
    Map<String, String?> errors = {};
    errors['comment'] = validateText(content, minLength: 1);

    return errorsAreEmpty(errors);
  }

  @override
  void addComment(String content, String userId) {
    if (_comments == null) return;
    _comments = [
      ..._comments!,
      CommentModel(
          id: '',
          userId: userId,
          username: 'Christian Stefaniw',
          profilePic: 'https://avatars.githubusercontent.com/u/67922410?v=4',
          content: content,
          likeCount: 0,
          liked: false,
          timeSincePost: 'now'),
    ];
  }
}
