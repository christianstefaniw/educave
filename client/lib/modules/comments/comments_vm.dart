import '../../core/types/view_model.dart';
import '../../core/util/listenable.dart';
import '../comment/comment_model.dart';
import 'comments_repository_interface.dart';

class CommentsViewModel with ViewModel {
  final ICommentsRepository _repository;

  bool _mounted = true;
  Listenable<List<CommentModel>>? _comments;

  CommentsViewModel(this._repository);

  Listenable<List<CommentModel>>? get comments => _comments;

  Future<void> loadComments() async {
    _comments = Listenable(await _repository.comments());

    if (_mounted) {
      _comments!.addListener(notifyListeners);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _mounted = false;

    if (_comments != null) {
      _comments!.removeListener(notifyListeners);
    }

    super.dispose();
  }
}
