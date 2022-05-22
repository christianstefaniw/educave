import '../../core/types/view_model.dart';
import '../post/post_model.dart';
import 'posts_repository_interface.dart';

abstract class PostsViewModel with ViewModel {
  final IPostsRepository _repository;

  bool _mounted = true;
  List<PostModel>? _posts;

  PostsViewModel(this._repository);

  Future<void> loadPosts() async {
    _posts = await _repository.posts();

    if (_mounted) {
      notifyListeners();
    }
  }

  bool get postsLoaded => _posts != null;

  List<PostModel>? get posts => _posts;

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
