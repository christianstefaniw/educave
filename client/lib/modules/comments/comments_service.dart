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
}
