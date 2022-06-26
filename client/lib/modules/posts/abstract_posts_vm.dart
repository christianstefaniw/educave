import '../../core/types/view_model.dart';
import '../post/post_model.dart';
import 'posts_model.dart';

abstract class PostsViewModel with ViewModel {
  final PostsModel _model;
  bool _mounted = true;

  PostsViewModel(this._model) {
    _loadPosts();
  }

  bool get postsLoaded => _model.posts != null;
  List<PostModel>? get posts => _model.posts;

  Future<void> _loadPosts() async {
    await _model.load();

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
