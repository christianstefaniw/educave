import '../comment/comment_model.dart';
import '../comment/comment_widget.dart';

abstract class ICommentsService {
  Future<void> loadComments();

  List<CommentModel>? get comments;
  void addComment(String comment, String userId);
  bool validateComment(String comment);
}
