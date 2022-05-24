import '../../core/types/view_model.dart';
import '../../core/util/listenable.dart';
import '../comment/comment_model.dart';
import 'account_data.dart';
import 'add_comment_repository_interface.dart';

class AddCommentViewModel with ViewModel {
  final IAddCommentRepository _repository;
  final Listenable<List<CommentModel>> _comments;
  final AccountCommentData _accountCommentData;

  bool _newCommentValid = false;

  AddCommentViewModel(this._repository,
      {required Listenable<List<CommentModel>> comments,
      required AccountCommentData accountCommentData})
      : _comments = comments,
        _accountCommentData = accountCommentData;

  bool get commentBeingAddedIsValid => _newCommentValid;

  void validateCommentDynamically(String content) {
    try {
      CommentModel.create(
        content,
        _accountCommentData.id,
        _accountCommentData.profilePic,
        _accountCommentData.name,
      );
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
        content,
        _accountCommentData.id,
        _accountCommentData.profilePic,
        _accountCommentData.name,
      );
    } catch (e) {
      return;
    }

    _repository.addComment(newComment);
    _comments.setState([..._comments.getState(), newComment]);
    _newCommentValid = false;
    notifyListeners();
  }
}
