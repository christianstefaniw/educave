import 'comment_model.dart';
import 'comment_repository_interface.dart';
import 'comment_service_interface.dart';

class CommentService implements ICommentService {
  final CommentModel _model;
  final ICommentRepository _commentRepository;

  CommentService(this._model, this._commentRepository);

  @override
  Future<void> delete() async {
    await _commentRepository.delete();
  }

  @override
  Future<void> like() async {
    _model.like();
    await _commentRepository.like();
  }

  @override
  Future<void> unlike() async {
    _model.unlike();
    await _commentRepository.unlike();
  }

  @override
  String get content => _model.content;

  @override
  String get username => _model.username;

  @override
  String get profilePic => _model.profilePic;

  @override
  int get likeCount => _model.likeCount;

  @override
  bool get liked => _model.liked;

  @override
  String get timeSincePost => _model.timeSincePost;
}
