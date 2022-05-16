import '../comment/comment_model.dart';
import '../comment/widgets/comment.dart';

abstract class ICommentsService {
  Future<void> loadComments();

  List<CommentModel>? get comments;
  void addComment(CommentModel comment);
}
